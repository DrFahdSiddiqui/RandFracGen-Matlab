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
classdef RandGenDomain < handle
    % RANDGENDOMAIN class to define domain properties and hold fracture objects
    
    %% Properties
    properties
        loc                     % Unroatated location coordinates of the domain
        locR                    % Roatated location coordinates of the domain
        Fn                      % Fracture number
        Nf                      % Total number of fractures in the domain
        Frac=RandGenFracture;   % Fracuture objects in the domain
    end
    %% Methods
    methods
        % ------------------------------------------------------------------- %
        function CreateFractureElements(Dom, Coord)
            % Function to create elements from a given Coordinate Matrix
            Dom.Nf=size(Coord,1);
            for i=1:size(Coord,1)
                Dom.Frac(i,1)=RandGenFracture;
            end
            
            for i=1:size(Coord,1)
                Dom.Frac(i,1).loc(1,:)=Coord(i,:);
                if Coord(i,2)<Coord(i,4)
                    for j=2:Coord(i,4)-Coord(i,2)
                        Dom.Frac(i,1).loc(j-1,3:4)= ...
                         [Dom.Frac(i,1).loc(j-1,1),Dom.Frac(i,1).loc(j-1,2)+1];
                        Dom.Frac(i,1).loc(j,1:2)=Dom.Frac(i,1).loc(j-1,3:4);
                    end
                end
                Dom.Frac(i,1).loc(end,3:4)=Coord(i,3:4);
                Dom.Frac(i,1).Ne=size(Dom.Frac(i,1).loc,1);
                Dom.Frac(i,1).Fn=i;
            end
        end
        % ------------------------------------------------------------------- %
        function [location]=GenerateInputLocation(Dom)
            % Function to generate a location matrix from unrotate matrix
            
            Dom.loc=[];
            
            Dom.Fn=[];
            for i=1:Dom.Nf
                Dom.loc=[Dom.loc;Dom.Frac(i).loc];
                Dom.Fn=[Dom.Fn;ones(Dom.Frac(i).Ne,1)*Dom.Frac(i).Fn];
            end
            location=[Dom.loc,Dom.Fn];
            
        end
        % ------------------------------------------------------------------- %
        function [locationR]=GenerateInputLocationR(Dom)
            % Function to generate rotated location matrix (Final form)
            Dom.locR=[];
            Dom.Fn=[];
            for i=1:Dom.Nf
                Dom.locR=[Dom.locR;Dom.Frac(i).locR];
                Dom.Fn=[Dom.Fn;ones(Dom.Frac(i).Ne,1)*Dom.Frac(i).Fn];
            end
            locationR=[Dom.locR,Dom.Fn];
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
