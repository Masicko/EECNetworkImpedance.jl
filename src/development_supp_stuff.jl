begin
    using DataFrames
    using PyPlot
    using CSV
                                                                                                            #20kN     # commercial?
    data_ID        = [1,      2,      3,      4,      5,      6,      7,      8,      9,      10,      11,      12,     13    ]; 
    data_LSM_ratio = [1.0,    0.9,    0.8,    0.7,    0.6,    0.5,    0.4,    0.3,    0.2,    0.1,     0.0,     0.5,    0.5   ];
    data_porosity  = [0.12,   0.22,   0.31,   0.37,   0.43,   0.56,   0.56,   0.62,   0.60,   0.68,    0.75,    0.12,   0.38  ];
    #data_porosity2 = [0.224,  0.384,  0.379,  0.426,  0.476,  0.583,  0.579,  0.633,  0.607,  0.687   0.755   0.182,  0.432 ];

    ID_list = collect(1:11)
    #ID_reduced_list = [1,2,3,4,5,7,8,9,10,11]

    # ID \ TEMP [800, 750, 700, 650, 600]
    data_conductivity = [
      286.14        205.52        150.50        124.49        107.75
      135.25        121.74        105.83        97.30        89.57
      44.72        43.30        41.29        39.99        38.25
      11.470        11.330        11.117        10.885        10.615
      0.3525        0.3437        0.3317        0.3191        0.3052
      0.8136        0.8024        0.7786        0.7493        0.7106
      0.0070        0.0028        0.0015        0.0010        5.18E-04
      0.0068        0.0043        0.0025        0.0013        7.44E-04
      0.0034        0.0021        0.0011        0.0007        3.68E-04
      0.0059        0.0020        0.0011        0.0006        3.31E-04
      0.0009        0.0005        0.0003        0.0002        8.22E-05
    ]

    T_all = [800        750        700        650        625        600        575        550        500        450        400][:]

    data_conductivity_all = [
      286.14        205.52        150.50        124.49        136.57        107.75        105.08        110.56        104.00        91.62        80.24
      135.25        121.74        105.83        97.30        95.42        89.57        85.82        85.82        81.98        75.12        65.29
      44.72        43.30        41.29        39.99        39.17        38.25        38.26        37.94        35.89        33.55        30.73
      11.470        11.330        11.117        10.885        10.755        10.615        10.480        10.358        9.956        9.468        8.863
      0.3525        0.3437        0.3317        0.3191        0.3123        0.3052        0.2979        0.2891        0.2738        0.2544        0.2321
      0.0070        0.0028        0.0015        0.0010        0.0007        5.18E-04        3.76E-04        2.26E-04        1.45E-04        6.95E-05        6.38E-05
      0.0068        0.0043        0.0025        0.0013        0.0010        7.44E-04        5.27E-04        3.76E-04        2.05E-04        7.95E-05        5.19E-05
      0.0034        0.0021        0.0011        0.0007        5.02E-04        3.68E-04        2.48E-04        1.80E-04        1.34E-04        5.69E-05        3.57E-05
      0.0059        0.0020        0.0011        0.0006        4.56E-04        3.31E-04        2.66E-04        2.14E-04        1.15E-04        6.01E-05        3.94E-05
      0.0009        0.0005        0.0003        0.0002        1.08E-04        8.22E-05        4.91E-05        3.19E-05        1.18E-05        1.74E-05        6.42E-06
      0.000870434259793        5.50E-04        0.000334929029929        0.000189407004622        0.000140364585972        0.00010041960414        7.00906939402481E-05        4.66970695171147E-05        1.82508568625571E-05        6.01280641560989E-06        1.67676168445884E-06
      0.8136        0.8024        0.7786        0.7493        0.7307        0.7106        0.6911        0.6725        0.6318        0.5841        0.5292
      0.2855213063114        0.264941482850389        0.247812772940326        0.231199439569648        0.223024930346909        0.21518012984918        0.207107306087703        0.19831989848563        0.181115235454019        0.163013183001346        0.144075620930711
    ]

    data_R_pol = [
      0        0        0        0        0        0        0        0        0        0        0
      0        0        0        0        0        0        0        0        0        0        0
      0        0        0        0        0        0        0        0        0        0        0
      0.002189323076715        0.002627187692058        0.002189323076715        0.001751458461372        0.002189323076715        0.001751458461372        0.001751458461372        0.001751458461372        0.001313593846029        0.001751458461372        0.001751458461372
      0.079019322586871        0.066295872339833        0.058929664302074        0.050224145711995        0.043527592950396        0.039509661293435        0.036831040188796        0.030804142703357        0.022768279389438        0.014732416075518        0.008705518590079
      2639        3775        7129        1.18E+04        1.63E+04        2.25E+04        3.62E+04        5.03E+04        1.71E+05        6.44E+05        1.44E+06
      1622        1999        3084        5654        8030        1.18E+04        1.79E+04        2.84E+04        8.32E+04        3.47E+05        9.10E+05
      856.7        1306        2154        4208        6156        9165        1.44E+04        2.48E+04        1.12E+05        2.02E+05        5.32E+05
      1427        839.5        1054        2104        3183        5067        8577        1.74E+04        4.25E+04        1.04E+05        3.78E+05
      517.9        502.2        921.1        1647        2647        4607        8466        1.13E+04        4.00E+04        1.40E+05        5.61E+05
      78.8        143.1        355.4        728        1019        2669        5155        9.83E+03        3.31E+04        1.27E+05        5.44E+05
      0        0        0        0        0        0        0        0        0        0        0
      0.655874923947836        0.591819198891359        0.507571995284472        0.432376144131217        0.390600671268297        0.350217714167475        0.304264694018264        0.262489221155345        0.16083557052224        0.096083587584715        0.048041793792358
    ]

    FITTED_DATA = [
     290.625        198.854        152.809        125.445        115.288        107.463        100.612        95.1453       87.0385       81.0511      76.9826
     153.373        104.525         80.1929        65.7946        60.8514        56.8068        52.8179       49.7155       45.8036       42.7735      40.6755
      65.4058        44.9536        34.4816        28.4113        25.7076        24.3631        22.7507       21.6988       19.8091       18.3852      17.3985
      20.698         14.1649        11.2526         9.31959        8.66418        7.9712         7.32685       6.68037       6.29497       5.84271      5.54615
       0.623237       0.397296       0.513257       0.11293        0.111772       0.0766833      0.126131      0.167018      0.024388      0.0104192    0.00253184
       0.00666219     0.00437432     0.0025636      0.00156443     0.00111846     0.000822249    0.000647934   0.000420881   0.000205793   7.50187e-5   2.6137e-5
       0.00521752     0.00322424     0.00187918     0.00111571     0.000823309    0.000584948    0.000456556   0.000315594   0.000142178   5.73381e-5   2.02544e-5
       0.000995022    0.000657704    0.000403358    0.000247611    0.000183514    0.000138636    0.00010743    7.21825e-5    3.67035e-5    1.76593e-5   8.5035e-6
       0.00156316     0.000962124    0.000548137    0.000341987    0.000249789    0.000185678    0.000143448   9.73203e-5    4.73104e-5    2.15353e-5   9.49879e-6
       1.81181e-5     1.57252e-5     1.47039e-5     1.31015e-5     1.31402e-5     1.12093e-5     1.10036e-5    9.45662e-6    7.4811e-6     5.63966e-6   4.07011e-6
       2.91272e-6     2.90575e-6     2.89366e-6     2.81449e-6     2.85292e-6     2.81159e-6     2.80045e-6    2.78023e-6    2.65693e-6    2.54858e-6   2.32576e-6
    ]
    function get_res_matrix(ID_list, prestring="DAN_DAN_2D_srovnani_id_", add_prms=[])
      res = []
      input_arr = ["porosity", "LSM_ratio"]
      push!(input_arr, add_prms)
      for row in ID_list       
        gdf = EECNetworkImpedance.show_plots(                      
                          "T",
                          input_arr
                          , 
                          prestring*"$(row)/",
                          apply_func = x -> 1/x,
                          throw_exception=false,
                          plot_bool=false
                       );
        push!(res, 1 ./DataFrame(gdf)[:, :R_mean])
      end
      m, n = length(res), length(res[1])
      res_matrix = Matrix(undef, m, n)
      for i in 1:m
        res_matrix[i, :] = reverse(res[i])
      end
      return res_matrix
    end

    function get_por_study_data(R_pol_list = [0.0, 0.18000000000000002, 0.9, 1.8, 9.0, 18.0], study_name="DAN_LSM_por_R_pol_LSM_study_id_1/")
      res = Dict()    
      porosity_values = collect(0.0 : 0.1 : 0.7)
      for act_R_pol in R_pol_list 
        res["R_pol" => act_R_pol] = DataFrame()
        #res["R_pol" => act_R_pol] = Matrix{Float64}(undef, 8, 21)
        gdf = EECNetworkImpedance.show_plots(                                    
                                        "LSM_ratio"  ,                                  
                                        [
                                         "porosity",# => [0.3], #56],                                     
                                         "p.R_pol_LSM" => act_R_pol
                                        ]
                                        , 
                      study_name,
                                        #apply_func = x -> log(10, x),
                                        throw_exception=false,
                                        #show_var=true,
                                        plot_bool=false
        );
        
        res["R_pol" => act_R_pol][:, Symbol("LSM_ratio")] = collect(0.0 : 0.05 : 1.0)
        for porosity_idx in [1, 2,3,4,5,6,7,8]
          act_conduct_data = 1 ./DataFrame(gdf[porosity_idx])[:, :R_mean]
          res["R_pol" => act_R_pol][:, Symbol("por_$(porosity_values[porosity_idx])")] = act_conduct_data            
        end        
      end
      return res
    end

    function save_CSV_files(mydict, R_pol_list = [0.0, 0.18000000000000002, 0.9, 1.8, 9.0, 18.0], ID_set = "1")
      for act_R_pol in R_pol_list
        CSV.write("set_$(ID_set)_R_pol_LSM_$(act_R_pol).csv", mydict["R_pol" => act_R_pol])
      end
    end


    # function plot_wrt_ID(exp, sim; Ts=[800, 750, 700, 650, 600])
    #   figure(2)       
    #   suptitle("Conductivities EXP vs SIM (3D: 20x20x20 ... 2D: 150x150)")
    #   for i in 1:length(Ts)
    #        subplot(340 + i)
    #        xlabel("sample ID")
    #        ylabel("log( sigma )")
    #        title("T = $(Ts[i])")
    #        #plot(log.(10, sim2D[:,i]), label="sim2D");
    #        plot(log.(10, sim[:,i]), label="sim");
    #        plot(log.(10, exp[:,i]), label="exp", "x-");
    #        legend()
    #   end
    # end

    function plot_wrt_ID(act_IDs, act_exp, act_sim; label="sim", Ts = [800, 750, 700, 650, 600])
    #     act_IDs = deepcopy(IDs)
    #     act_sim = sim_DAN
        figure(2)
        
        suptitle("Conductivities EXP vs SIM (3D: 20x20x20 ... 2D: 150x150)")
        for i in 1:length(Ts)
            subplot(3,4,0 + i)
            xlabel("sample ID")
            ylabel("log( sigma )")
            title("T = $(Ts[i])")
            #plot(log.(10, sim2D[:,i]), label="sim2D");        
            if typeof(act_exp) != Nothing
              plot(act_IDs, log.(10, [act_exp[spec_ID,i] for spec_ID in act_IDs]), label="exp", "x-");  
            end
            plot(act_IDs, log.(10, [act_sim[spec_ID,i] for spec_ID in act_IDs]), label=label);
            legend()
        end
    end

    function plot_wrt_Temp(act_IDs, act_sim; label="sim", Ts = [800, 750, 700, 650, 600])
    #     act_IDs = deepcopy(IDs)
    #     act_sim = sim_DAN
        figure(99)
        
        #suptitle("Conductivities against TEMPERATURE")
        for ID in act_IDs
            #subplot(230 + i)
            xlabel("Temp")
            ylabel("sigma")
            #title("T = $(Ts[i])")
            #plot(log.(10, sim2D[:,i]), label="sim2D");        
            plot(Ts, [act_sim[ID,i] for i in 1:5], label="ID $(ID)");
            legend()
        end
    end

    function plot_T_danovi(ID_list, mat; line_style="-", TCs = [800, 750, 700, 650, 600])
        Ts = 273 .+ TCs
        Es = []
        for ID in ID_list
            ss = mat[ID, :]
            xs = 1000 ./Ts
            #ys = log.(Ts .* ss)
            ys = log.(ss)
            
            slope = (ys[end] - ys[1])/(xs[end] - xs[1])
            E = -slope * 8.314 * 0.0104
            @show slope, E
            push!(Es, E)

            
            figure(5)
            plot(xs, ys, label="ID $(ID)", line_style)
            legend()
        end
        figure(4)
        title("Activation energy")
        plot(data_LSM_ratio[ID_list], Es, line_style)
        xlabel("LSM ratio")
        ylabel("E [eV]")
        legend()
        @show data_LSM_ratio[ID_list]
        @show Es
    end










    function plot_paths()
      paths_legend = ["path1", "path2", "path3", "path4"]
      figure(6)
      title("Paths in porosity & LSM_ratio")
      s_list = range(0.0, 1.0, length=10000)

      plot( [prmz1(s)[1] for s in s_list], [prmz1(s)[2] for s in s_list], label = paths_legend[1])
      plot( [prmz2(s)[1] for s in s_list], [prmz2(s)[2] for s in s_list], label = paths_legend[2])
      plot( [prmz3(s)[1] for s in s_list], [prmz3(s)[2] for s in s_list], label = paths_legend[3])
      plot( [prmz4(s)[1] for s in s_list], [prmz4(s)[2] for s in s_list], label = paths_legend[4])
      legend()

      xlabel("porosity")
      ylabel("LSM_ratio")
    end








    function prmz4(t)
               A = (0.12, 1.0)
               B = (0.56, 0.5)
               #
               M1 = (0.37, 0.7)
               M2 = (0.12, 0.5)
               ns = 3
               if t < 1/ns
                   return (1 - t*ns) .* A .+ t*ns * M1
               elseif 1/ns <= t < 2/ns
                   return (1 - (t - 1/ns)*ns) .* M1 .+ (t - 1/ns)*ns .* M2
               else
                   return (1 - (t - 2/ns)*ns) .* M2 .+ (t- 2/ns)*ns .* B
               end
           end



    function get_R_LSM_resistance()
      @time for add_rep in collect(1:10)
        EECNetworkImpedance.run_par_study(
            par_study_prms_dict = Dict(
                                    "matrix_template" => EECNetworkImpedance.homogenous_matrix,
                                    #
                                    "repetition_idx" => collect(1:3),
                                    #
                                    "LSM_ratio" => collect(1.0 : 0.05 : 1.0),
                                    "porosity" => collect(0.224 : 0.03 : 0.224),
                                    #
                                    "p.R_LSM" => collect(0.001 : 0.001 : 0.007),
                                    
                                    #
                                    "dimensions" => [(20, 20, 20)],
                                    #
                                    ), 
            scripted_prms_names = ["p.R_LSM"], 
            save_to_file_prefix = "R_LSM_resistance_new_porosity__TEMP/addREP$(add_rep)",
            direct = false,
            shell_command = "sbatch"
          )
        end
        sdf = EECNetworkImpedance.show_plots(
                                 #"s",
                                 #"configuration", 
                                 #"dimensions",
                                 #"LSM_ratio",
                                 "p.R_LSM",
                                 [
                                  #"porosity",# => [0.37],
                                  #"LSM_ratio",# => 0.5,
                                  #"pore_ratio",
                                  #"p.R_LSM",
                                  #"T",
                                  #"configuration",
                                  #"dimensions",# => ["(25, 25, 25)"],
                                 ]
                                 , 
                                 "R_LSM_resistance_new_porosity__TEMP/",
                                 #apply_func = x -> 1/x,
                                 throw_exception=false
                              );
    end



    ###########
    function get_extrapolated_R_LSM(R_LSM, R_mean, R_mean_value)
      y = R_LSM
      x = R_mean
      slope = (y[end] - y[1])/
              (x[end] - x[1])
      # f(x) = y = slope*x + b
      # b = y[1] - slope*x[1]
      b = y[1] - slope*x[1]
      return slope*R_mean_value + b
    end
      
    function obtain_R_LSM_fit_for(ID=2)
      gdf = EECNetworkImpedance.show_plots(
                                 #"T",
                                 #"configuration", 
                                 #"dimensions",
                                 #"LSM_ratio",
                                 "p.R_LSM",
                                 #"p.R_pol_LSM",
                                 #"porosity",
                                 [
                                  #"porosity" => [0.56],
                                  #"LSM_ratio" => 0.,
                                  #"pore_ratio",
                                  #"p.R_pol_LSM",
                                  "T", # => 800,
                                  #"configuration",
                                  #"dimensions",# => ["(25, 25, 25)"],
                                 ]
                                 , 
               "R_LSM_temp_study_for_$(ID)/",
                                 #apply_func = x -> log(10, x),
                                 throw_exception=false,
                                 show_var=true,
                                 plot_bool=false
                              )
      data_R_2_T_descending = 1 ./data_conductivity_all[ID, :]
      data_R_2_true = reverse(data_R_2_T_descending)
      #
      R_LSM_fit = zeros(11)
      for ID_act in collect(1:11)
          R_LSM_fit[ID_act] = get_extrapolated_R_LSM(
              gdf[ID_act][!, "p.R_LSM"],
              gdf[ID_act][!, "R_mean"],
              data_R_2_true[ID_act]
          )
      end
      return R_LSM_fit
    end
    end