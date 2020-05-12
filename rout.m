function c = rout(ann)

ai = 1:length(ann);
c = cell(length(ai),1);
for jj = 1:length(ai)
    ab = zeros(length(ai)-1,length(ai));
    gg = ai(ai~=jj);
    for ii = 1:length(gg)
        ab(ii,gg(ii)) = 1;
    end
    c{jj,1} = ab;
%     ab(:,jj) = ones(size(1,size(ab,2)));
%     c{jj,2} = ab;
end

end