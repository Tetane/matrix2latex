function latexmat = matrix2latex(mat, strformat, nodisplay)
% Display a matlab matrix in latex format
% INPUTS:
%   mat: the matrix to convert to latex
%   strformat: string format (cf str2num documentation)
%   nodisplay: optional parameter to choose not to display the matrix
%
% Example:
%   mat = rand(4)
%   latexmat = matrix2latex(mat, '%.2f');
%   % the function displays the matrix with 2 decimals:
%   0.07 & 0.45 & 0.34 & 0.35 \\ 
%   0.71 & 0.54 & 0.47 & 0.03 \\ 
%   0.51 & 0.82 & 0.29 & 0.75 \\ 
%   0.98 & 0.13 & 0.61 & 0.38 \\
%
% latexmat = matrix2latex(mat, '%.2f', 'nodisplay');
%  % with 'nodisplay' in third parameter the function will not display the matrix.
%

if nargin == 2
    display = true;
elseif nargin == 3
    if strcmp(nodisplay, 'nodisplay')
        display = false;
    end
end

mat = mat';
sizemat = size(mat);
indstr = cell(1,prod(sizemat));

for indm = 1:prod(sizemat)
    [ind1, ind2] = ind2sub(sizemat, indm);
    if ind1 == sizemat(1)
        endstr = ' \\\\ \n';
    else
        endstr = ' & ';
    end
    indstr{indm} = sprintf([num2str(mat(ind1,ind2), strformat), endstr]);
end

latexmat = cell2mat(indstr);

if display
    disp(latexmat);
end

end

