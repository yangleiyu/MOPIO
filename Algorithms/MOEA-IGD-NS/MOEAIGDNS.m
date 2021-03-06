function MOEAIGDNS(Global)
% <algorithm> <H-N>
% A Multi-objective Evolutionary Algorithm Based on an Enhanced Inverted
% Generational Distance Metric

%--------------------------------------------------------------------------
% The copyright of the PlatEMO belongs to the BIMK Group. You are free to
% use the PlatEMO for research purposes. All publications which use this
% platform or any code in the platform should acknowledge the use of
% "PlatEMO" and reference "Ye Tian, Ran Cheng, Xingyi Zhang, and Yaochu
% Jin, PlatEMO: A MATLAB Platform for Evolutionary Multi-Objective
% Optimization, 2016".
%--------------------------------------------------------------------------

% Copyright (c) 2016-2017 BIMK Group

    %% Generate the sampling points and random population
    Population = Global.Initialization();
    Archive    = UpdateArchive(Population,5*Global.N);

    %% Optimization
    while Global.NotTermination(Population)
        MatingPool = randi(Global.N,1,Global.N);
        Offspring  = Global.Variation(Population(MatingPool));
        Archive    = UpdateArchive([Archive,Offspring],5*Global.N);
        Population = EnvironmentalSelection([Population,Offspring],Archive.objs,Global.N);
    end
end