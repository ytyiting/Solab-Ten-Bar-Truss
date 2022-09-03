function [sigma, Q] = sol_TenBarTruss(r1, r2)
    % step1 : Element Table
    E = 200 * 10.^9; % 單位轉換
    Node_Coordinate = [[18.28 9.14]
                        [18.28 0]
                        [9.14 9.14]
                        [9.14 0]
                        [0 9.14]
                        [0 0]];
    Element_Table = [[3 5 E 0 0 0 0]
                    [1 3 E 0 0 0 0]
                    [4 6 E 0 0 0 0]
                    [2 4 E 0 0 0 0]
                    [3 4 E 0 0 0 0]
                    [1 2 E 0 0 0 0]
                    [4 5 E 0 0 0 0]
                    [3 6 E 0 0 0 0]
                    [2 3 E 0 0 0 0]
                    [1 4 E 0 0 0 0]];
    for i = 1:10
        if i < 7
            Element_Table(i,4) = pi * r1 * r1;
        else 
            Element_Table(i,4) = pi * r2 * r2;
        end
        Element_Table(i,5) = sqrt((((Node_Coordinate(Element_Table(i,1),1) - Node_Coordinate(Element_Table(i,2),1))).^2 ...
            + ((Node_Coordinate(Element_Table(i,1),2) - Node_Coordinate(Element_Table(i,2),2))).^2));
        if i == 7 || i == 9
            Element_Table(i,6) = (Node_Coordinate(Element_Table(i,2),1) - Node_Coordinate(Element_Table(i,1),1)) / Element_Table(i,5);
            Element_Table(i,7) = (Node_Coordinate(Element_Table(i,2),2) - Node_Coordinate(Element_Table(i,1),2)) / Element_Table(i,5);
        else
            Element_Table(i,6) = -(Node_Coordinate(Element_Table(i,2),1) - Node_Coordinate(Element_Table(i,1),1)) / Element_Table(i,5);
            Element_Table(i,7) = -(Node_Coordinate(Element_Table(i,2),2) - Node_Coordinate(Element_Table(i,1),2)) / Element_Table(i,5);
        end
    end   
    % 開一個空白的剛性矩陣
    K = zeros(12,12);
    % 計算stiffness matrix(可使用 add_element 函數)
    for i = 1 : 10
        K = add_element(K,Element_Table(i,4),200,Element_Table(i,5),acos(Element_Table(i,6)),...
            Element_Table(i,1),Element_Table(i,2));
    end
    K = K*10^9; % 單位轉換
    K = round(K, 3);
    % 建立力矩陣
    F_matrix = transpose([0 0 0 -10.^7 0 0 0 -10.^7 0 0 0 0]);
    % 建立空白位移矩陣
    Q = zeros(12,1);
    % 計算位移量
    K_reduced = K(1:8,1:8);
    F_reduced = F_matrix(1:8,1);
    Q_reduced = inv(K_reduced) * F_reduced;
    Q(1:8,1) = Q_reduced;
    % 建立空白應力矩陣
    sigma = zeros(10,1);
    % 計算應力 (stress) (可使用 compute_stress 函數)
    for i = 1:10
        sigma(i,1) = compute_stress(Q,E,Element_Table(i,5),acos(Element_Table(i,6)),Element_Table(i,1),Element_Table(i,2));
    end
    % (optional) compute reactions
    R = zeros(12,1);
    K_reaction = K(9:12,1:12);
    R(9:12,1) = K_reaction * Q;
end