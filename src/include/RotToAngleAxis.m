function [h,theta] = RotToAngleAxis(R)
%EULER REPRESENTATION: Given a tensor rotation matrices this function
% should output the equivalent angle-axis representation values,
% respectively 'theta' (angle), 'h' (axis) 
% SUGGESTED FUNCTIONS
    % size()
    % eye()
    % abs()
    % det()
    % NB: Enter a square, 3x3 proper-orthogonal matrix to calculate its angle
    % and axis of rotation. Error messages must be displayed if the matrix
    % does not satisfy the rotation matrix criteria.

    I = eye(3,3);
    % Check matrix R to see if its size is 3x3
    if any([3 3] ~= size(R))
        error("R is not a 3x3 matrix.")
    end
    if ((det(R) ~= 1) || any(R * R' ~= I,"all"))
        error("R can't be a rotation matrix.")
    end

    theta = acos((sum(R .* I, "all") - 1) / 2);
    a = vex(R);
    % Axial vector a, a = sin(theta) * h => h = a / sin(theta)
    h = a / sin(theta);
end

 
function a = vex(S_a)
% input: skew matrix S_a (3x3)
% output: the original a vector (3x1)
% a = sin(theta) * h = (R - R') / 2
a = (S_a - S_a') / 2;
end