function fixed_R_YSZ()
  return CubicSplineInterpolation(      
      400 : 50 : 800
      , 
      # good old values
#       1 ./reverse([  
#         0.044905404632136
#         0.03005779931599
#         0.01725995101764
#         0.010115351717062        
#         0.005578168458813
#       ])
     [7117.605847672608, 2114.9814479065467, 797.276608811544, 355.8905520639076, 179.3722805261549, 98.58649408163319, 57.508846847040736, 34.79286341124463, 21.345325997801112]
    )
end

function higher_R_YSZ()
  return CubicSplineInterpolation(
      400 : 50 : 800
      ,
      [6488.618962340055, 1798.0760586172794, 688.6075391507817, 288.31596662108393, 138.5334927576768, 73.65717446659315, 42.83950155040441, 27.16694634585147, 18.47673167901793]
  )
end

function TI_YSZ_hi(T)
  higher_R_YSZ()(T)
end


# temperature data are in degrees of Celsia
# resistanace data are in Ohm/cm
# ... a bit different interpretation of porosity
function TI_clank(label)
  if label == "R_LSM"
    
    return CubicSplineInterpolation(      
        600 : 50 : 800
      , 
      # fitted to 3D with "clankova" porozita      
      [0.004640194824206025, 0.0040162711411057365, 0.0033223061268364204, 0.0024328408017493925, 0.0017474026238125484]
      # fitted to 2D
      #[0.005764, 0.005022, 0.00413, 0.003021, 0.002185]      
    )
  elseif label == "R_YSZ"
    # ok data from pure YSZ (porosity = 0.0)
    return fixed_R_YSZ()
 end  
end

function TI(label)
  if label == "R_LSM"
    
    return CubicSplineInterpolation(      
        400 : 50 : 800
      , 
      # fitted to 3D
      #[0.006418221532022811, 0.005556938763855908, 0.004598968863545539, 0.00337112453237228, 0.0024249253299838836]
      # fitted to Arrhenius
      reverse([0.0023791737306332874, 0.0034822232065221514, 0.0045371752044443565, 0.005529292648158158, 0.006442314232029504, 0.007259068848237902, 0.007962660126965605, 0.008538466354425307, 0.008977162955002883])

      # fitted to 2D
      #[0.005764, 0.005022, 0.00413, 0.003021, 0.002185]      
    )
  elseif label == "R_YSZ"
    # ok data from pure YSZ (porosity = 0.0)
    return fixed_R_YSZ()
 end
end

function TI_2D(label)
  if label == "R_LSM"
    
    return CubicSplineInterpolation(      
        600 : 50 : 800
      , 
      # fitted to 3D
      #[0.006418221532022811, 0.005556938763855908, 0.004598968863545539, 0.00337112453237228, 0.0024249253299838836]
      # fitted to 2D
      [0.005764, 0.005022, 0.00413, 0.003021, 0.002185]
    )
  elseif label == "R_YSZ"
    # ok data from pure YSZ (porosity = 0.0)
    return fixed_R_YSZ()
 end
end

function TI_ID2(label)
  if label == "R_LSM"
    
    return CubicSplineInterpolation(      
        400 : 50 : 800
      , 
      # fitted to 3D
      #[0.006418221532022811, 0.005556938763855908, 0.004598968863545539, 0.00337112453237228, 0.0024249253299838836]
      # fitted to ID2
      [0.005590962194220286, 0.004773793433382758, 0.004431112664648542, 0.004234842505638187, 0.0040313014108289405, 0.0037592826559953167, 0.003452432961234127, 0.0029918256776954, 0.002696322648135628]
      # fitted to 2D
      #[0.005764, 0.005022, 0.00413, 0.003021, 0.002185]      
    )
  elseif label == "R_YSZ"
    # ok data from pure YSZ (porosity = 0.0)
    return fixed_R_YSZ()
 end
end

function TI_ID2_new(label)
  if label == "R_LSM"
    
    return CubicSplineInterpolation(      
        400 : 50 : 800
      , 
      # fitted to 3D
      #[0.006418221532022811, 0.005556938763855908, 0.004598968863545539, 0.00337112453237228, 0.0024249253299838836]
      # fitted to ID2
      [0.005643685467489298, 0.004896133757997614, 0.004492122543396562, 0.0042949178652860595, 0.004116320990863979, 0.0037828358034380683, 0.0034780731135354197, 0.003027661032018827, 0.002721083168867914]
      # fitted to 2D
      #[0.005764, 0.005022, 0.00413, 0.003021, 0.002185]      
    )
  elseif label == "R_YSZ"
    # ok data from pure YSZ (porosity = 0.0)
    return fixed_R_YSZ()
 end
end

function TI_ID3(label)
  if label == "R_LSM"
    
    return CubicSplineInterpolation(      
        400 : 50 : 800
      , 
      # fitted to ID3
      [0.0052240224386946015, 0.004812411856752034, 0.004475775005583696, 0.004251730069171851, 0.004208608380269227, 0.004010146960005849, 0.003893044953906655, 0.003698047205560599, 0.0035858367423405296]
      )
  elseif label == "R_YSZ"
    # ok data from pure YSZ (porosity = 0.0)
    return fixed_R_YSZ()
 end
end

function TI_ID4(label)
  if label == "R_LSM"
    
    return CubicSplineInterpolation(      
        400 : 50 : 800
      , 
      # fitted to ID4
      [0.005999792579179058, 0.005581950919708278, 0.005258921060291729, 0.005082438344387712, 0.004992620437684282, 0.0048641761432520305, 0.004753800090658466, 0.004688522158212704, 0.0046125799860434425]
    )
  elseif label == "R_YSZ"
    # ok data from pure YSZ (porosity = 0.0)
    return fixed_R_YSZ()
 end
end


function TI_por_LSM(T)
  #0.12 porosity LSM 
  return CubicSplineInterpolation(      
      600 : 50 : 800
    , 1 ./reverse([
    286.138977466499
    205.521051620173
    150.497871331355
    124.493586820521
    107.754096313306
    ])
  )(T)
end

TI(label, T) = TI(label)(T)
TI_2D(label, T) = TI_2D(label)(T)
TI_clank(label, T) = TI_clank(label)(T)

TI_ID2(label, T) = TI_ID2(label)(T)
TI_ID2_new(label, T) = TI_ID2_new(label)(T)
TI_ID3(label, T) = TI_ID3(label)(T)
TI_ID4(label, T) = TI_ID4(label)(T)
