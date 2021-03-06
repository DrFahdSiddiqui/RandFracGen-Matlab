%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%                        RANDOM FRACTURE GENERATOR                            %
%                               Version 1.0                                   %
%                  Written for MATLAB by : Fahd Siddiqui                      %
%           https://github.com/DrFahdSiddiqui/RandFracGen-Matlab              %
%                                                                             %
% =========================================================================== %
% LICENSE: MOZILLA 2.0                                                        %
%   This Source Code Form is subject to the terms of the Mozilla Public       %
%   License, v. 2.0. If a copy of the MPL was not distributed with this       %
%   file, You can obtain one at http://mozilla.org/MPL/2.0/.                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
classdef RandGenFracture < handle
    % RANDGENFRACTURE class to hold fracture elements and other properties
    
    %% Properties
    properties
        loc                 % Unroatated location coordinates of the fracture
        locR                % Rotated location coordinates of the fracture
        Fn=0                % Fracture number 
        Ne=0                % Total number of elements in this fracture
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
