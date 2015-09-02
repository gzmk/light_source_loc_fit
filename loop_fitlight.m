%% Loop through two fits 
% Step 1: Start from alphau = 0.2, fit ro_s and ro_d
% Step 2: Get the XBest from above fit and fix them, fit only alphau
function loop_fitlight()

% iter = 5;
setGlobalalpha(0.2);
setGlobalrod(0.1);
setGlobalros(0.04); %40 gloss

% init 2 param fitting
LB_2 = [-0.5; -0.5];
UB_2 = [0.5; 0.5];
NumDiv_2 = [5 5];
MinDeltaX_2 = [1e-5 1e-5];

bestfit_2pr = [];

bestLight = [];

fitname1 = '40percent_lightLoc.mat';

[LightBest, BestF2] = gridsearch(@renderIm_2params_light, LB_2, UB_2, 5, 0.5, 1e-7, 1000, 1, 1);
% [LightBest,BestF2,Iters2] = Grid_Search(2, LB_2', UB_2', NumDiv_2, MinDeltaX_2, 1e-7, 1000, 'renderIm_2params_light');
sprintf('This is LightBest:');
LightBest;
setGloballightx(LightBest(1))
setGloballighty(LightBest(2))
bestLight = [bestLight;LightBest];
bestfit_2pr = [bestfit_2pr;BestF2];
% delta1 = bestLight(i,1)*0.01;
% delta2 = bestLight(i,2)*0.01;
% 
% if i>1
%     converge1 = abs(bestLight(i,1)-bestLight(i-1,1));
%     converge2 = abs(bestLight(i,2)-bestLight(i-1,2));
% end

imname = strcat('/scratch/gk925/light_source_loc_fit/fit_results/multispectral/', fitname1);
save(imname, 'bestLight','bestfit_2pr');

% if i>1 && (converge1<=delta1) && (converge2<=delta2)
%     sprintf('Parameters converged! Exiting the loop')
%     break
% end

return;
