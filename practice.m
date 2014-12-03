PT = getPT();

P_win = 0;
P_tie = 0;
P_loss = 0;

for i = 1:9
    for j = 1:9
        if (i<j)
            P_loss = P_loss + PT(i,j);
        end
        if (i == j)
            P_tie = P_tie + PT(i,j);
        end
        if (i > j)
            P_win = P_win + PT(i,j);
        end
    end
end

P_matrix = [P_win, P_tie, P_loss]