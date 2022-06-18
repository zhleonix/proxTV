%
% install(nopar)    proxTV installation
%
% Compiles the required mex -v files for the proxTV library.
%
% Inputs:
%   - [mode]: compilation mode
%       0: parallelization with OpenMP (default)
%       1: no parallelization
%       2: parallelization with mwlpack
%       3: debug mode
%
function install(nopar)
    % Check arguments.
    if ~exist('nopar', 'var'), nopar=0;
    else 
        if ~isa(nopar, 'double'), error('Input argument must be numeric'); end
    end

    setenv('LIBPATH', [matlabroot,'\extern\lib\win64\microsoft'])

    disp('Installing proxTV...');
    cd matlab

    if nopar == 0
        % Compile C modules
        mex -v -c -cxx CXXOPTIMFLAGS=-O3 CXXFLAGS='$CXXFLAGS -fopenmp -fPIC' LDFLAGS='$LDFLAGS -fopenmp' ...
            -lmwlapack -lmwblas ...
            ../src/TVgenopt.cpp ../src/TVL1opt.cpp ../src/TVL1Wopt.cpp ...
            ../src/TVL2opt.cpp ../src/TVLPopt.cpp ../src/TV2Dopt.cpp ...
            ../src/TV2DWopt.cpp ../src/TVNDopt.cpp ../src/LPopt.cpp ...
            ../src/utils.cpp ../src/condat_fast_tv.cpp ../src/johnsonRyanTV.cpp ...
            ../src/TVL1opt_tautstring.cpp ../src/TVL1opt_hybridtautstring.cpp ...
            ../src/TVL1opt_kolmogorov.cpp

        % Compile mex -v interfaces
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_condat.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_condattautstring.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_johnson.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_PN.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_linearizedTautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_classicTautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_hybridTautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_kolmogorov.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" TVL1Weighted.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" TVL1Weighted_tautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2_morec.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2_PGc.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2_morec2.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTVgen.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_DR.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_PD.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_CondatChambollePock.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_Yang.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_Kolmogorov.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2DL1W.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV3D_Yang.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTVND_PDR.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTVp_GPFW.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV.cpp "*.obj"
    elseif nopar == 1
        disp('WARNING: parallelization disabled');
        % Compile C modules
        mex -v -c -cxx CXXOPTIMFLAGS=-O3 CXXFLAGS='$CXXFLAGS -fPIC' ...
            ../src/TVgenopt.cpp ../src/TVL1opt.cpp ../src/TVL1Wopt.cpp ...
            ../src/TVL2opt.cpp ../src/TVLPopt.cpp ../src/TV2Dopt.cpp ...
            ../src/TV2DWopt.cpp ../src/TVNDopt.cpp ../src/LPopt.cpp ...
            ../src/utils.cpp ../src/condat_fast_tv.cpp ../src/johnsonRyanTV.cpp
            
        % Compile mex -v interfaces
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV1_condat.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV1_condattautstring.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV1_johnson.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV1_PN.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV1_linearizedTautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV1_classicTautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV1_hybridTautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV1_kolmogorov "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 TVL1Weighted.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 TVL1Weighted_tautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV2_morec.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV2_PGc.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV2_morec2.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTVgen.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV2D_DR.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV2D_PD.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV2D_CondatChambollePock.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV2D_Yang.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV2D_Kolmogorov.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV2DL1W.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV3D_Yang.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTVND_PDR.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTVp_GPFW.cpp "*.obj"
        mex -v -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-O3 solveTV.cpp "*.obj"
    elseif nopar == 2
        disp('Installing multisrc mwlpack version');
        % Compile C modules
        mex -v -c -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS='$CXXFLAGS -fopenmp -fPIC' LDFLAGS='$LDFLAGS -fopenmp' ...
            ../src/TVgenopt.cpp ../src/TVL1opt.cpp ../src/TVL1Wopt.cpp ...
            ../src/TVL2opt.cpp ../src/TVLPopt.cpp ../src/TV2Dopt.cpp ...
            ../src/TV2DWopt.cpp ../src/TVNDopt.cpp ../src/LPopt.cpp ...
            ../src/utils.cpp ../src/condat_fast_tv.cpp ../src/johnsonRyanTV.cpp

        % Compile mex -v interfaces
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_condat.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_condattautstring.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_johnson.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_PN.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_linearizedTautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_classicTautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_hybridTautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_kolmogorov "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" TVL1Weighted.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" TVL1Weighted_tautString.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2_morec.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2_PGc.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2_morec2.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTVgen.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_DR.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_PD.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_CondatChambollePock.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_Yang.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_Kolmogorov.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2DL1W.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV3D_Yang.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTVND_PDR.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTVp_GPFW.cpp "*.obj"
        mex -v -cxx -lmwlapack -lm CXXOPTIMFLAGS=-O3 CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV.cpp "*.obj"
    else
        disp('WARNING: Installing in debug mode');
        % Compile C modules
        mex -v -c -DDEBUG -cxx CXXOPTIMFLAGS=-g CXXFLAGS='$CXXFLAGS -fopenmp -fPIC' LDFLAGS='$LDFLAGS -fopenmp' ...
            ../src/TVgenopt.cpp ../src/TVL1opt.cpp ../src/TVL1Wopt.cpp ...
            ../src/TVL2opt.cpp ../src/TVLPopt.cpp ../src/TV2Dopt.cpp ...
            ../src/TV2DWopt.cpp ../src/TVNDopt.cpp ../src/LPopt.cpp ...
            ../src/utils.cpp ../src/condat_fast_tv.cpp ../src/johnsonRyanTV.cpp
        
        % Compile mex -v interfaces
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_condat.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_condattautstring.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_johnson.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_PN.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_linearizedTautString.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_classicTautString.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_hybridTautString.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV1_kolmogorov "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" TVL1Weighted.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" TVL1Weighted_tautString.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2_morec.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2_PGc.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2_morec2.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTVgen.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_DR.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_PD.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_CondatChambollePock.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_Yang.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2D_Kolmogorov.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV2DL1W.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV3D_Yang.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTVND_PDR.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTVp_GPFW.cpp "*.obj"
        mex -v -DDEBUG -cxx -lmwlapack -lmwblas CXXOPTIMFLAGS=-g CXXFLAGS="$CXXFLAGS -fopenmp" LDFLAGS="$LDFLAGS -fopenmp" solveTV.cpp "*.obj"
    end
    cd ..

    % Add relevant proxTV folders to Matlab's path
    here = pwd();
    addpath([here,'/matlab']);
    addpath([here,'/matlab/demos']);
    savepath();

    disp('proxTV successfully installed.');
end
