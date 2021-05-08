//
//  HelioPositions.swift
//  CelestrialBodies
//
//  Created by William Tong on 14/6/2020.
//  Copyright © 2020 William Tong. All rights reserved.
//
// -3000 - 3000
//               a              e               I                L            long.peri.      long.node.
//           AU, AU/Cy     rad, rad/Cy     deg, deg/Cy      deg, deg/Cy      deg, deg/Cy     deg, deg/Cy
//------------------------------------------------------------------------------------------------------
//Mercury   0.38709843      0.20563661      7.00559432      252.25166724     77.45771895     48.33961819
//          0.00000000      0.00002123     -0.00590158   149472.67486623      0.15940013     -0.12214182
//Venus     0.72332102      0.00676399      3.39777545      181.97970850    131.76755713     76.67261496
//         -0.00000026     -0.00005107      0.00043494    58517.81560260      0.05679648     -0.27274174
//EM Bary   1.00000018      0.01673163     -0.00054346      100.46691572    102.93005885     -5.11260389
//         -0.00000003     -0.00003661     -0.01337178    35999.37306329      0.31795260     -0.24123856
//Mars      1.52371243      0.09336511      1.85181869       -4.56813164    -23.91744784     49.71320984
//          0.00000097      0.00009149     -0.00724757    19140.29934243      0.45223625     -0.26852431
//Jupiter   5.20248019      0.04853590      1.29861416       34.33479152     14.27495244    100.29282654
//         -0.00002864      0.00018026     -0.00322699     3034.90371757      0.18199196      0.13024619
//Saturn    9.54149883      0.05550825      2.49424102       50.07571329     92.86136063    113.63998702
//         -0.00003065     -0.00032044      0.00451969     1222.11494724      0.54179478     -0.25015002
//Uranus   19.18797948      0.04685740      0.77298127      314.20276625    172.43404441     73.96250215
//         -0.00020455     -0.00001550     -0.00180155      428.49512595      0.09266985      0.05739699
//Neptune  30.06952752      0.00895439      1.77005520      304.22289287     46.68158724    131.78635853
//          0.00006447      0.00000818      0.00022400      218.46515314      0.01009938     -0.00606302
//Pluto    39.48686035      0.24885238     17.14104260      238.96535011    224.09702598    110.30167986
//          0.00449751      0.00006016      0.00000501      145.18042903     -0.00968827     -0.00809981
//------------------------------------------------------------------------------------------------------

//                b             c             s            f
//---------------------------------------------------------------
//Jupiter   -0.00012452    0.06064060   -0.35635438   38.35125000
//Saturn     0.00025899   -0.13434469    0.87320147   38.35125000
//Uranus     0.00058331   -0.97731848    0.17689245    7.67025000
//Neptune   -0.00041348    0.68346318   -0.10162547    7.67025000
//Pluto     -0.01262724
//---------------------------------------------------------------

// 1800-2050
//               a              e               I                L            long.peri.      long.node.
//           AU, AU/Cy     rad, rad/Cy     deg, deg/Cy      deg, deg/Cy      deg, deg/Cy     deg, deg/Cy
//-----------------------------------------------------------------------------------------------------------
//Mercury   0.38709927      0.20563593      7.00497902      252.25032350     77.45779628     48.33076593
//          0.00000037      0.00001906     -0.00594749   149472.67411175      0.16047689     -0.12534081
//Venus     0.72333566      0.00677672      3.39467605      181.97909950    131.60246718     76.67984255
//          0.00000390     -0.00004107     -0.00078890    58517.81538729      0.00268329     -0.27769418
//EM Bary   1.00000261      0.01671123     -0.00001531      100.46457166    102.93768193      0.0
//          0.00000562     -0.00004392     -0.01294668    35999.37244981      0.32327364      0.0
//Mars      1.52371034      0.09339410      1.84969142       -4.55343205    -23.94362959     49.55953891
//          0.00001847      0.00007882     -0.00813131    19140.30268499      0.44441088     -0.29257343
//Jupiter   5.20288700      0.04838624      1.30439695       34.39644051     14.72847983    100.47390909
//         -0.00011607     -0.00013253     -0.00183714     3034.74612775      0.21252668      0.20469106
//Saturn    9.53667594      0.05386179      2.48599187       49.95424423     92.59887831    113.66242448
//         -0.00125060     -0.00050991      0.00193609     1222.49362201     -0.41897216     -0.28867794
//Uranus   19.18916464      0.04725744      0.77263783      313.23810451    170.95427630     74.01692503
//         -0.00196176     -0.00004397     -0.00242939      428.48202785      0.40805281      0.04240589
//Neptune  30.06992276      0.00859048      1.77004347      -55.12002969     44.96476227    131.78422574
//          0.00026291      0.00005105      0.00035372      218.45945325     -0.32241464     -0.00508664
//Pluto    39.48211675      0.24882730     17.14001206      238.92903833    224.06891629    110.30393684
//         -0.00031596      0.00005170      0.00004818      145.20780515     -0.04062942     -0.01183482

import Combine
import Foundation
struct PlanetAttribute{
    var auDistance:Double
    var eccentric:Double
    var inclination:Double
    var meanLongitude:Double
    var longitudePerihelion:Double
    var longitudeAscendeNode:Double
}

struct EccentricPlanetAttribute{
    
    var meanAnomaly:Double
    var augmentedLongPerihelion:Double
    var eccentricMeanAnomaly:Double
}
struct PlanetHelioCoord {
    var helioX:Double
    var helioY:Double
    var helioZ:Double
}

struct HelioCoordDataFull{
    var orbitalPlaneX:Double
    var orbitalPlaneY:Double
    var eclipticX:Double
    var eclipticY:Double
    var eclipticZ:Double
}

struct PlanetGeoCoord {
    var geoX:Double
    var geoY:Double
    var geoZ:Double
}

struct GeoLatLon {
    var longitude:Double
    var latitude:Double
}

struct WheelData {
    var julianCentury:Double
//    var nineGeoCoordinates:[PlanetGeoCoord]!
    var nineGeoLatLon:[GeoLatLon]

}

struct HelioPositions{
    
    let mercuryMeanLong_3000:Double = 252.25166724
    let mercuryMeanLongCentury_3000:Double = 149472.67486623
    let mercuryLongPerihelion_3000:Double = 77.45771895
    let mercuryLongPerihelionCentury_3000:Double = 0.15940013
    let mercuryLongAscendedNode_3000:Double = 48.33961819
    let mercuryLongAscendedNodeCentury_3000:Double = -0.12214182
    let mercuryEccentric_3000:Double = 0.20563661
    let mercuryEccentricCentury_3000:Double = 0.00002123
    let mercuryAuDistance_3000:Double = 0.38709843
    let mercuryAuDistanceCentury_3000:Double = 0
    let mercuryInclination_3000:Double = 7.00559432
    let mercuryInclinationCentury_3000:Double = -0.00590158
    
    let mercuryAugmented_b:Double = 0
    let mercuryAugmented_c:Double = 0
    let mercuryAugmented_s:Double = 0
    let mercuryAugmented_f:Double = 0
    
    let venusMeanLong_3000:Double = 181.97970850
    let venusMeanLongCentury_3000:Double = 58517.81560260
    let venusLongPerihelion_3000:Double = 131.76755713
    let venusLongPerihelionCentury_3000:Double = 0.05679648
    let venusLongAscendedNode_3000:Double = 76.67261496
    let venusLongAscendedNodeCentury_3000:Double = -0.27274174
    let venusEccentric_3000:Double = 0.00676399
    let venusEccentricCentury_3000:Double = -0.00005107
    let venusAuDistance_3000:Double = 0.72332102
    let venusAuDistanceCentury_3000:Double = -0.00000026
    let venusInclination_3000:Double = 3.39777545
    let venusInclinationCentury_3000:Double = 0.00043494
    
    let venusAugmented_b:Double = 0
    let venusAugmented_c:Double = 0
    let venusAugmented_s:Double = 0
    let venusAugmented_f:Double = 0
    
    let earthMeanLong_3000:Double = 100.46691572
    let earthMeanLongCentury_3000:Double = 35999.37306329
    let earthLongPerihelion_3000:Double = 102.93005885
    let earthLongPerihelionCentury_3000:Double = 0.31795260
    let earthLongAscendedNode_3000:Double = -5.11260389
    let earthLongAscendedNodeCentury_3000:Double = -0.24123856
    let earthEccentric_3000:Double = 0.01673163
    let earthEccentricCentury_3000:Double =  -0.00003661
    let earthAuDistance_3000:Double = 1.00000018
    let earthAuDistanceCentury_3000:Double = -0.00000003
    let earthInclination_3000:Double = -0.00054346
    let earthInclinationCentury_3000:Double = -0.01337178
    
    let earthAugmented_b:Double = 0
    let earthAugmented_c:Double = 0
    let earthAugmented_s:Double = 0
    let earthAugmented_f:Double = 0
    
    let marsMeanLong_3000:Double = -4.56813164
    let marsMeanLongCentury_3000:Double = 19140.29934243
    let marsLongPerihelion_3000:Double = -23.91744784
    let marsLongPerihelionCentury_3000:Double = 0.45223625
    let marsLongAscendedNode_3000:Double = 49.71320984
    let marsLongAscendedNodeCentury_3000:Double = -0.26852431
    let marsEccentric_3000:Double = 0.09336511
    let marsEccentricCentury_3000:Double =  0.00009149
    let marsAuDistance_3000:Double = 1.52371243
    let marsAuDistanceCentury_3000:Double = 0.00000097
    let marsInclination_3000:Double = 1.85181869
    let marsInclinationCentury_3000:Double = -0.00724757
    
    let marsAugmented_b:Double = 0
    let marsAugmented_c:Double = 0
    let marsAugmented_s:Double = 0
    let marsAugmented_f:Double = 0
    
    let jupiterMeanLong_3000:Double = 34.33479152
    let jupiterMeanLongCentury_3000:Double = 3034.90371757
    let jupiterLongPerihelion_3000:Double = 14.27495244
    let jupiterLongPerihelionCentury_3000:Double = 0.18199196
    let jupiterLongAscendedNode_3000:Double = 100.29282654
    let jupiterLongAscendedNodeCentury_3000:Double = 0.13024619
    let jupiterEccentric_3000:Double = 0.04853590
    let jupiterEccentricCentury_3000:Double =  0.00018026
    let jupiterAuDistance_3000:Double = 5.20248019
    let jupiterAuDistanceCentury_3000:Double = -0.00002864
    let jupiterInclination_3000:Double = 1.29861416
    let jupiterInclinationCentury_3000:Double = -0.00322699
    
    let jupiterAugmented_b:Double =  -0.00012452
    let jupiterAugmented_c:Double = 0.06064060
    let jupiterAugmented_s:Double = -0.35635438
    let jupiterAugmented_f:Double = 38.35125000
    
    let saturnMeanLong_3000:Double = 50.07571329
    let saturnMeanLongCentury_3000:Double = 1222.11494724
    let saturnLongPerihelion_3000:Double = 92.86136063
    let saturnLongPerihelionCentury_3000:Double = 0.54179478
    let saturnLongAscendedNode_3000:Double = 113.63998702
    let saturnLongAscendedNodeCentury_3000:Double = -0.25015002
    let saturnEccentric_3000:Double = 0.05550825
    let saturnEccentricCentury_3000:Double =  -0.00032044
    let saturnAuDistance_3000:Double = 9.54149883
    let saturnAuDistanceCentury_3000:Double = -0.00003065
    let saturnInclination_3000:Double = 2.49424102
    let saturnInclinationCentury_3000:Double = 0.00451969
    
    let saturnAugmented_b:Double = 0.00025899
    let saturnAugmented_c:Double = -0.13434469
    let saturnAugmented_s:Double = 0.87320147
    let saturnAugmented_f:Double = 38.35125000
    
    let uranusMeanLong_3000:Double = 314.20276625
    let uranusMeanLongCentury_3000:Double = 428.49512595
    let uranusLongPerihelion_3000:Double = 172.43404441
    let uranusLongPerihelionCentury_3000:Double = 0.09266985
    let uranusLongAscendedNode_3000:Double = 73.96250215
    let uranusLongAscendedNodeCentury_3000:Double = 0.05739699
    let uranusEccentric_3000:Double = 0.04685740
    let uranusEccentricCentury_3000:Double =  -0.00001550
    let uranusAuDistance_3000:Double = 19.18797948
    let uranusAuDistanceCentury_3000:Double = -0.00020455
    let uranusInclination_3000:Double = 0.77298127
    let uranusInclinationCentury_3000:Double = -0.00180155
    
    let uranusAugmented_b:Double = 0.00058331
    let uranusAugmented_c:Double = -0.97731848
    let uranusAugmented_s:Double = 0.17689245
    let uranusAugmented_f:Double = 7.67025000
    
    let neptuneMeanLong_3000:Double = 304.22289287
    let neptuneMeanLongCentury_3000:Double = 218.46515314
    let neptuneLongPerihelion_3000:Double = 46.68158724
    let neptuneLongPerihelionCentury_3000:Double = 0.01009938
    let neptuneLongAscendedNode_3000:Double = 131.78635853
    let neptuneLongAscendedNodeCentury_3000:Double = -0.00606302
    let neptuneEccentric_3000:Double = 0.00895439
    let neptuneEccentricCentury_3000:Double =  0.00000818
    let neptuneAuDistance_3000:Double = 30.06952752
    let neptuneAuDistanceCentury_3000:Double = 0.00006447
    let neptuneInclination_3000:Double = 1.77005520
    let neptuneInclinationCentury_3000:Double = 0.00022400
    
    let neptuneAugmented_b:Double = -0.00041348
    let neptuneAugmented_c:Double = 0.68346318
    let neptuneAugmented_s:Double = -0.10162547
    let neptuneAugmented_f:Double = 7.67025000
    
    let plutoMeanLong_3000:Double = 238.96535011
    let plutoMeanLongCentury_3000:Double = 145.18042903
    let plutoLongPerihelion_3000:Double = 224.09702598
    let plutoLongPerihelionCentury_3000:Double = -0.00968827
    let plutoLongAscendedNode_3000:Double = 110.30167986
    let plutoLongAscendedNodeCentury_3000:Double = -0.00809981
    let plutoEccentric_3000:Double = 0.24885238
    let plutoEccentricCentury_3000:Double =  0.00006016
    let plutoAuDistance_3000:Double = 39.48686035
    let plutoAuDistanceCentury_3000:Double = 0.00449751
    let plutoInclination_3000:Double = 17.14104260
    let plutoInclinationCentury_3000:Double = 0.00000501
    
    let plutoAugmented_b:Double = -0.01262724
    let plutoAugmented_c:Double = 0
    let plutoAugmented_s:Double = 0
    let plutoAugmented_f:Double = 0
    
    
    
    
    let mercuryMeanLong_2050:Double = 252.25032350
    let mercuryMeanLongCentury_2050:Double = 149472.67411175
    let mercuryLongPerihelion_2050:Double = 77.45779628
    let mercuryLongPerihelionCentury_2050:Double = 0.16047689
    let mercuryLongAscendedNode_2050:Double = 48.33076593
    let mercuryLongAscendedNodeCentury_2050:Double = -0.12534081
    let mercuryEccentric_2050:Double = 0.20563593
    let mercuryEccentricCentury_2050:Double = 0.00001906
    let mercuryAuDistance_2050:Double = 0.38709927
    let mercuryAuDistanceCentury_2050:Double = 0.00000037
    let mercuryInclination_2050:Double = 7.00497902
    let mercuryInclinationCentury_2050:Double = -0.00594749
    
    
    
    let venusMeanLong_2050:Double = 181.97909950
    let venusMeanLongCentury_2050:Double = 58517.81538729
    let venusLongPerihelion_2050:Double = 131.60246718
    let venusLongPerihelionCentury_2050:Double = 0.00268329
    let venusLongAscendedNode_2050:Double = 76.67984255
    let venusLongAscendedNodeCentury_2050:Double = -0.27769418
    let venusEccentric_2050:Double = 0.00677672
    let venusEccentricCentury_2050:Double = -0.00004107
    let venusAuDistance_2050:Double = 0.72333566
    let venusAuDistanceCentury_2050:Double = 0.00000390
    let venusInclination_2050:Double = 3.39467605
    let venusInclinationCentury_2050:Double = -0.00078890
    
  
    
    let earthMeanLong_2050:Double = 100.46457166
    let earthMeanLongCentury_2050:Double = 35999.37244981
    let earthLongPerihelion_2050:Double = 102.93768193
    let earthLongPerihelionCentury_2050:Double = 0.32327364
    let earthLongAscendedNode_2050:Double = 0.0
    let earthLongAscendedNodeCentury_2050:Double = 0.0
    let earthEccentric_2050:Double = 0.01671123
    let earthEccentricCentury_2050:Double =  -0.00004392
    let earthAuDistance_2050:Double = 1.00000261
    let earthAuDistanceCentury_2050:Double = 0.00000562
    let earthInclination_2050:Double = -0.00001531
    let earthInclinationCentury_2050:Double = -0.01294668
    

   
    let marsMeanLong_2050:Double = -4.55343205
    let marsMeanLongCentury_2050:Double = 19140.30268499
    let marsLongPerihelion_2050:Double = -23.94362959
    let marsLongPerihelionCentury_2050:Double = 0.44441088
    let marsLongAscendedNode_2050:Double = 49.55953891
    let marsLongAscendedNodeCentury_2050:Double = -0.29257343
    let marsEccentric_2050:Double = 0.09339410
    let marsEccentricCentury_2050:Double =  0.00007882
    let marsAuDistance_2050:Double = 1.52371034
    let marsAuDistanceCentury_2050:Double = 0.00001847
    let marsInclination_2050:Double = 1.84969142
    let marsInclinationCentury_2050:Double = -0.00813131
    

    
    
    let jupiterMeanLong_2050:Double = 34.39644051
    let jupiterMeanLongCentury_2050:Double = 3034.74612775
    let jupiterLongPerihelion_2050:Double = 14.72847983
    let jupiterLongPerihelionCentury_2050:Double = 0.21252668
    let jupiterLongAscendedNode_2050:Double = 100.47390909
    let jupiterLongAscendedNodeCentury_2050:Double = 0.20469106
    let jupiterEccentric_2050:Double = 0.04838624
    let jupiterEccentricCentury_2050:Double =  -0.00013253
    let jupiterAuDistance_2050:Double = 5.20288700
    let jupiterAuDistanceCentury_2050:Double = -0.00011607
    let jupiterInclination_2050:Double = 1.30439695
    let jupiterInclinationCentury_2050:Double = -0.00183714
    
    
    
    let saturnMeanLong_2050:Double = 49.95424423
    let saturnMeanLongCentury_2050:Double = 1222.49362201
    let saturnLongPerihelion_2050:Double = 92.59887831
    let saturnLongPerihelionCentury_2050:Double = -0.41897216
    let saturnLongAscendedNode_2050:Double = 113.66242448
    let saturnLongAscendedNodeCentury_2050:Double = -0.28867794
    let saturnEccentric_2050:Double = 0.05386179
    let saturnEccentricCentury_2050:Double =  -0.00050991
    let saturnAuDistance_2050:Double = 9.53667594
    let saturnAuDistanceCentury_2050:Double = -0.00125060
    let saturnInclination_2050:Double = 2.48599187
    let saturnInclinationCentury_2050:Double = 0.00193609
    

   
    
    let uranusMeanLong_2050:Double = 313.23810451
    let uranusMeanLongCentury_2050:Double = 428.48202785
    let uranusLongPerihelion_2050:Double = 170.95427630
    let uranusLongPerihelionCentury_2050:Double = 0.40805281
    let uranusLongAscendedNode_2050:Double = 74.01692503
    let uranusLongAscendedNodeCentury_2050:Double = 0.04240589
    let uranusEccentric_2050:Double = 0.04725744
    let uranusEccentricCentury_2050:Double =  -0.00004397
    let uranusAuDistance_2050:Double = 19.18916464
    let uranusAuDistanceCentury_2050:Double = -0.00196176
    let uranusInclination_2050:Double = 0.77263783
    let uranusInclinationCentury_2050:Double = -0.00242939
    

    
    
    let neptuneMeanLong_2050:Double = 304.87997031
    let neptuneMeanLongCentury_2050:Double = 218.45945325
    let neptuneLongPerihelion_2050:Double = 44.96476227
    let neptuneLongPerihelionCentury_2050:Double = -0.32241464
    let neptuneLongAscendedNode_2050:Double = 131.78422574
    let neptuneLongAscendedNodeCentury_2050:Double = -0.00508664
    let neptuneEccentric_2050:Double = 0.00859048
    let neptuneEccentricCentury_2050:Double =  0.00005105
    let neptuneAuDistance_2050:Double = 30.06992276
    let neptuneAuDistanceCentury_2050:Double = 0.00026291
    let neptuneInclination_2050:Double = 1.77004347
    let neptuneInclinationCentury_2050:Double = 0.00035372
    
 
    
    let plutoMeanLong_2050:Double = 238.92903833
    let plutoMeanLongCentury_2050:Double = 145.20780515
    let plutoLongPerihelion_2050:Double = 224.06891629
    let plutoLongPerihelionCentury_2050:Double = -0.04062942
    let plutoLongAscendedNode_2050:Double = 110.30393684
    let plutoLongAscendedNodeCentury_2050:Double = -0.01183482
    let plutoEccentric_2050:Double = 0.24882730
    let plutoEccentricCentury_2050:Double =  0.00005170
    let plutoAuDistance_2050:Double = 39.48211675
    let plutoAuDistanceCentury_2050:Double = -0.00031596
    let plutoInclination_2050:Double = 17.14001206
    let plutoInclinationCentury_2050:Double = 0.00004818
    

    
    
    
//
//    var longPerihelionInstance:Double!
//
//    var longAscendedNodeInstance:Double!
//
//    var eccentricInstance:Double!
//
//    var auDistanceInstance:Double!
//
//
//    var meanAnomaly:Double!
//    var eccentricAnomaly:Double!
//    var orbitalPlaneX:Double!
//    var orbitalPlaneY:Double!
//    var eclipticX:Double!
//    var eclipticY:Double!
//    var eclipticZ:Double!
//
//    var equatorialX:Double!
//    var equatorialY:Double!
//    var equatorialZ:Double!
//
//
//    var augmentedLongPerihelion:Double!
//
//    var inclinationInstance:Double!
//    var meanLongInstance:Double!
    var wheelPos = [WheelData]()
    init(julianCentury:Double, recentDate:Bool){
       
        var geoCoors = [GeoLatLon]()
        
       
        if !recentDate {
            geoCoors = calcGeoCoordEx(julianCentury: julianCentury)
            wheelPos.append(WheelData(julianCentury:julianCentury,nineGeoLatLon:geoCoors))
        }else if recentDate {
            geoCoors = calcGeoCoordX(julianCentury: julianCentury)
            wheelPos.append(WheelData(julianCentury:julianCentury,nineGeoLatLon:geoCoors))
        }
            
      
    }
        



    
 
//    static var helper = HelioPositions()
//

    //1
    func planetParameters(
        meanLong:Double,
        meanLongCentury:Double,
        longPerihelion:Double,
        longPerihelionCentury:Double,
        longAscendedNode:Double,
        longAscendedNodeCentury:Double,
        eccentricity:Double,
        eccentricityCentury:Double,
        auDistance:Double,
        auDistanceCentury:Double,
        inclination:Double,
        inclinationCentury:Double,
        julianCentury:Double) -> PlanetAttribute{
        
        
        
        let auDistanceInstance = auDistance + auDistanceCentury * julianCentury
        let eccentricInstance = eccentricity + eccentricityCentury * julianCentury
        let inclinationInstance = inclination + inclinationCentury * julianCentury
        
//        print("delta longitude \(meanLongCentury * julianCentury)")
//        print("delta longitude mode \((meanLongCentury * julianCentury).truncatingRemainder(dividingBy: 360))")
//        print("delta longitude mode \((meanLongCentury * julianCentury).remainder(dividingBy: 360))")
              
        let meanLongInstance =  (meanLong + (meanLongCentury * julianCentury).truncatingRemainder(dividingBy: 360)).truncatingRemainder(dividingBy: 360)
       
        
        let longPerihelionInstance = (longPerihelion + longPerihelionCentury * julianCentury).truncatingRemainder(dividingBy: 360)
        let longAscendedNodeInstance = (longAscendedNode + longAscendedNodeCentury * julianCentury).truncatingRemainder(dividingBy: 360)
           
        return PlanetAttribute(auDistance: auDistanceInstance,
                               eccentric: eccentricInstance,
                               inclination: inclinationInstance,
                               meanLongitude: meanLongInstance,
                               longitudePerihelion: longPerihelionInstance,
                               longitudeAscendeNode: longAscendedNodeInstance)
       
        
    }
    //2
    func adjustedParameters(_ julianCentury:Double,_ attrInstance:PlanetAttribute, _ augmented_b:Double, _ augmented_c:Double, _ augmented_s:Double, _ augmented_f:Double) -> EccentricPlanetAttribute{
        
        
        // M  mean anomaly = mean longitude - perihelion longitude
        
        let meanAnomaly = calcMeanAnomaly(julianCentury: julianCentury, meanLongInstance: attrInstance.meanLongitude,
                                      longPerihelionInstance: attrInstance.longitudePerihelion,
                                      augmented_b,augmented_c,augmented_s,augmented_f)
        // augmented longitude of perihelion = longitude of perihelion - longditue of ascended node
        // argument of perihelion
        let augmentedLongPerihelion = attrInstance.longitudePerihelion - attrInstance.longitudeAscendeNode
        
        let eccentricAnomaly = calcEccentricAnomaly(attrInstance: attrInstance, meanAnomaly: meanAnomaly)
        
        return EccentricPlanetAttribute(meanAnomaly: meanAnomaly, augmentedLongPerihelion: augmentedLongPerihelion, eccentricMeanAnomaly: eccentricAnomaly)
    }
    
    func calcMeanAnomaly(julianCentury:Double,
                         meanLongInstance:Double,
                         longPerihelionInstance:Double,
                         _ outerParameter_b:Double,
                         _ outerParameter_c:Double,
                         _ outerParameter_s:Double,
                         _ outerParameter_f:Double)->Double{
        var anomalyM:Double!
      
        let m = meanLongInstance - longPerihelionInstance
        let b = outerParameter_b * pow(julianCentury, 2)
        let c = outerParameter_c * cos(outerParameter_f * julianCentury * Double.pi/180)
        let s = outerParameter_s * sin(Double.pi/180 * outerParameter_f * julianCentury)
        
        anomalyM = m + b + c + s
    
        var normailizer = anomalyM.truncatingRemainder(dividingBy: 360)
        if normailizer > 180{
            normailizer = -(360 - normailizer)
        }
        
        return normailizer
        
    }
    
    func calcEccentricAnomaly(attrInstance:PlanetAttribute, meanAnomaly:Double)->Double{
        //E = M + eDegree * sin(M)
        let eccentricAnom = meanAnomaly + 180/Double.pi * attrInstance.eccentric * sin(meanAnomaly * Double.pi/180)
        var deltaMeanAnom:Double
        var deltaEccentricAnom:Double = 999
        var curEccentricAnom = eccentricAnom
        
        var nextEccentricAnom:Double
        while abs(deltaEccentricAnom) > 0.000001 {
            
            deltaMeanAnom = meanAnomaly - (curEccentricAnom - 180/Double.pi * attrInstance.eccentric * sin(curEccentricAnom * .pi/180))
            deltaEccentricAnom = deltaMeanAnom/(1 - attrInstance.eccentric * cos(curEccentricAnom * .pi/180))
            nextEccentricAnom = curEccentricAnom + deltaEccentricAnom
            curEccentricAnom = nextEccentricAnom
        }
        
        return curEccentricAnom
    }
    
    
    //3
    func calcHelioCoord(auInstance:Double, attrInstance:PlanetAttribute, eccAttrInstance:EccentricPlanetAttribute) -> HelioCoordDataFull{
        
        let orbitalPlaneX = auInstance * (cos(.pi/180 *  eccAttrInstance.eccentricMeanAnomaly) - attrInstance.eccentric)
        
        let orbitalPlaneY = auInstance * sqrt(1 - pow(attrInstance.eccentric, 2)) * sin(.pi/180 * eccAttrInstance.eccentricMeanAnomaly)// eccentricAnomaly)
        
        
        
        let eclipticX = (cos(.pi/180 * eccAttrInstance.augmentedLongPerihelion) * cos(.pi/180 * attrInstance.longitudeAscendeNode) - sin(.pi/180 * eccAttrInstance.augmentedLongPerihelion) * sin(.pi/180 * attrInstance.longitudeAscendeNode) * cos(.pi/180 * attrInstance.inclination)) * orbitalPlaneX + (-1 * sin(.pi/180 * eccAttrInstance.augmentedLongPerihelion) * cos(.pi/180 * attrInstance.longitudeAscendeNode) - cos(.pi/180 * eccAttrInstance.augmentedLongPerihelion) * sin(.pi/180 * attrInstance.longitudeAscendeNode) * cos(.pi/180 * attrInstance.inclination)) * orbitalPlaneY
        
        
        let eclipticY = (cos(.pi/180 * eccAttrInstance.augmentedLongPerihelion) * sin(.pi/180 * attrInstance.longitudeAscendeNode) + sin(.pi/180 * eccAttrInstance.augmentedLongPerihelion) * cos(.pi/180 * attrInstance.longitudeAscendeNode) * cos(.pi/180 * attrInstance.inclination)) * orbitalPlaneX + (-1 * sin(.pi/180 * eccAttrInstance.augmentedLongPerihelion) * sin(.pi/180 * attrInstance.longitudeAscendeNode) + cos(.pi/180 * eccAttrInstance.augmentedLongPerihelion) * cos(.pi/180 * attrInstance.longitudeAscendeNode) * cos(.pi/180 * attrInstance.inclination)) * orbitalPlaneY
        
        let eclipticZ = sin(.pi/180 * eccAttrInstance.augmentedLongPerihelion) * sin(.pi/180 * attrInstance.inclination) * orbitalPlaneX + cos(.pi/180 * eccAttrInstance.augmentedLongPerihelion) * sin(.pi/180 * attrInstance.inclination) * orbitalPlaneY
//        
//        equatorialX = eclipticX
//        equatorialY = cos(23.49328 * .pi/180) * eclipticY - sin(23.49328 * .pi/180) * eclipticZ
//        equatorialZ = sin(23.49328 * .pi/180) * eclipticY + cos(23.49328 * .pi/180) * eclipticZ
        return HelioCoordDataFull(orbitalPlaneX: orbitalPlaneX, orbitalPlaneY: orbitalPlaneY, eclipticX: eclipticX, eclipticY: eclipticY, eclipticZ: eclipticZ)
        
    }
    
    func calcGeoCoordEx(julianCentury:Double) -> [GeoLatLon]{
        
        let earthInstance = planetParameters(meanLong: earthMeanLong_3000,
                         meanLongCentury: earthMeanLongCentury_3000,
                         longPerihelion: earthLongPerihelion_3000,
                         longPerihelionCentury: earthLongPerihelionCentury_3000,
                         longAscendedNode: earthLongAscendedNode_3000,
                         longAscendedNodeCentury: earthLongAscendedNodeCentury_3000,
                         eccentricity: earthEccentric_3000,
                         eccentricityCentury: earthEccentricCentury_3000,
                         auDistance: earthAuDistance_3000,
                         auDistanceCentury: earthAuDistanceCentury_3000,
                         inclination: earthInclination_3000,
                         inclinationCentury: earthInclinationCentury_3000,
                         julianCentury: julianCentury)
        let eccentricEarthInstance = adjustedParameters(julianCentury,earthInstance,earthAugmented_b,earthAugmented_c,earthAugmented_s,earthAugmented_f)
        
        let earthAUInstance = earthInstance.auDistance
        let earthHelioInstanceData = calcHelioCoord(auInstance: earthAUInstance,attrInstance: earthInstance,eccAttrInstance: eccentricEarthInstance)
        let earthHelioEcl = PlanetHelioCoord(helioX: earthHelioInstanceData.eclipticX, helioY: earthHelioInstanceData.eclipticY, helioZ: earthHelioInstanceData.eclipticZ)
       print("compute earth helio \(earthHelioEcl)")
        
        
        let mercuryInstance = planetParameters(meanLong: mercuryMeanLong_3000,
                         meanLongCentury: mercuryMeanLongCentury_3000,
                         longPerihelion: mercuryLongPerihelion_3000,
                         longPerihelionCentury: mercuryLongPerihelionCentury_3000,
                         longAscendedNode: mercuryLongAscendedNode_3000,
                         longAscendedNodeCentury: mercuryLongAscendedNodeCentury_3000,
                         eccentricity: mercuryEccentric_3000,
                         eccentricityCentury: mercuryEccentricCentury_3000,
                         auDistance: mercuryAuDistance_3000,
                         auDistanceCentury: mercuryAuDistanceCentury_3000,
                         inclination: mercuryInclination_3000,
                         inclinationCentury: mercuryInclinationCentury_3000,
                         julianCentury: julianCentury)
        let eccentricMercuryInstance = adjustedParameters(julianCentury,mercuryInstance,mercuryAugmented_b,mercuryAugmented_c,mercuryAugmented_s,mercuryAugmented_f)
        let mercuryAUInstance = mercuryInstance.auDistance
        let mercuryHelioInstanceData = calcHelioCoord(auInstance: mercuryAUInstance,attrInstance: mercuryInstance,eccAttrInstance: eccentricMercuryInstance)
        let mercuryHelioEcl = PlanetHelioCoord(helioX: mercuryHelioInstanceData.eclipticX, helioY: mercuryHelioInstanceData.eclipticY, helioZ: mercuryHelioInstanceData.eclipticZ)
        print("compute earth mercury helio \(mercuryHelioEcl)")
        
        let venusInstance = planetParameters(meanLong: venusMeanLong_3000,
                         meanLongCentury: venusMeanLongCentury_3000,
                         longPerihelion: venusLongPerihelion_3000,
                         longPerihelionCentury: venusLongPerihelionCentury_3000,
                         longAscendedNode: venusLongAscendedNode_3000,
                         longAscendedNodeCentury: venusLongAscendedNodeCentury_3000,
                         eccentricity: venusEccentric_3000,
                         eccentricityCentury: venusEccentricCentury_3000,
                         auDistance: venusAuDistance_3000,
                         auDistanceCentury: venusAuDistanceCentury_3000,
                         inclination: venusInclination_3000,
                         inclinationCentury: venusInclinationCentury_3000,
                         julianCentury: julianCentury)
        let eccentricVenusInstance = adjustedParameters(julianCentury,venusInstance,venusAugmented_b,venusAugmented_c,venusAugmented_s,venusAugmented_f)
        let venusAUInstance = venusInstance.auDistance
        let venusHelioInstanceData = calcHelioCoord(auInstance: venusAUInstance,attrInstance: venusInstance,eccAttrInstance: eccentricVenusInstance)
        let venusHelioEcl = PlanetHelioCoord(helioX: venusHelioInstanceData.eclipticX, helioY: venusHelioInstanceData.eclipticY, helioZ: venusHelioInstanceData.eclipticZ)
        
        
        let marsInstance = planetParameters(meanLong: marsMeanLong_3000,
                         meanLongCentury: marsMeanLongCentury_3000,
                         longPerihelion: marsLongPerihelion_3000,
                         longPerihelionCentury: marsLongPerihelionCentury_3000,
                         longAscendedNode: marsLongAscendedNode_3000,
                         longAscendedNodeCentury: marsLongAscendedNodeCentury_3000,
                         eccentricity: marsEccentric_3000,
                         eccentricityCentury: marsEccentricCentury_3000,
                         auDistance: marsAuDistance_3000,
                         auDistanceCentury: marsAuDistanceCentury_3000,
                         inclination: marsInclination_3000,
                         inclinationCentury: marsInclinationCentury_3000,
                         julianCentury: julianCentury)
        let eccentricMarsInstance = adjustedParameters(julianCentury,marsInstance,marsAugmented_b,marsAugmented_c,marsAugmented_s,marsAugmented_f)
        let marsAUInstance = marsInstance.auDistance
        let marsHelioInstanceData = calcHelioCoord(auInstance: marsAUInstance,attrInstance: marsInstance,eccAttrInstance: eccentricMarsInstance)
        let marsHelioEcl = PlanetHelioCoord(helioX: marsHelioInstanceData.eclipticX, helioY: marsHelioInstanceData.eclipticY, helioZ: marsHelioInstanceData.eclipticZ)
        
        
        let jupiterInstance = planetParameters(meanLong: jupiterMeanLong_3000,
                         meanLongCentury: jupiterMeanLongCentury_3000,
                         longPerihelion: jupiterLongPerihelion_3000,
                         longPerihelionCentury: jupiterLongPerihelionCentury_3000,
                         longAscendedNode: jupiterLongAscendedNode_3000,
                         longAscendedNodeCentury: jupiterLongAscendedNodeCentury_3000,
                         eccentricity: jupiterEccentric_3000,
                         eccentricityCentury: jupiterEccentricCentury_3000,
                         auDistance: jupiterAuDistance_3000,
                         auDistanceCentury: jupiterAuDistanceCentury_3000,
                         inclination: jupiterInclination_3000,
                         inclinationCentury: jupiterInclinationCentury_3000,
                         julianCentury: julianCentury)
        let eccentricJupiterInstance = adjustedParameters(julianCentury,jupiterInstance,jupiterAugmented_b,jupiterAugmented_c,jupiterAugmented_s,jupiterAugmented_f)
        let jupiterAUInstance = jupiterInstance.auDistance
        let jupiterHelioInstanceData = calcHelioCoord(auInstance: jupiterAUInstance,attrInstance: jupiterInstance,eccAttrInstance: eccentricJupiterInstance)
        let jupiterHelioEcl = PlanetHelioCoord(helioX: jupiterHelioInstanceData.eclipticX, helioY: jupiterHelioInstanceData.eclipticY, helioZ: jupiterHelioInstanceData.eclipticZ)
        
        
        let saturnInstance = planetParameters(meanLong: saturnMeanLong_3000,
                         meanLongCentury: saturnMeanLongCentury_3000,
                         longPerihelion: saturnLongPerihelion_3000,
                         longPerihelionCentury: saturnLongPerihelionCentury_3000,
                         longAscendedNode: saturnLongAscendedNode_3000,
                         longAscendedNodeCentury: saturnLongAscendedNodeCentury_3000,
                         eccentricity: saturnEccentric_3000,
                         eccentricityCentury: saturnEccentricCentury_3000,
                         auDistance: saturnAuDistance_3000,
                         auDistanceCentury: saturnAuDistanceCentury_3000,
                         inclination: saturnInclination_3000,
                         inclinationCentury: saturnInclinationCentury_3000,
                         julianCentury: julianCentury)
        let eccentricSaturnInstance = adjustedParameters(julianCentury,saturnInstance,saturnAugmented_b,saturnAugmented_c,saturnAugmented_s,saturnAugmented_f)
        let saturnAUInstance = saturnInstance.auDistance
        let saturnHelioInstanceData = calcHelioCoord(auInstance: saturnAUInstance,attrInstance: saturnInstance,eccAttrInstance: eccentricSaturnInstance)
        let saturnHelioEcl = PlanetHelioCoord(helioX: saturnHelioInstanceData.eclipticX, helioY: saturnHelioInstanceData.eclipticY, helioZ: saturnHelioInstanceData.eclipticZ)
        
        
        let uranusInstance = planetParameters(meanLong: uranusMeanLong_3000,
                         meanLongCentury: uranusMeanLongCentury_3000,
                         longPerihelion: uranusLongPerihelion_3000,
                         longPerihelionCentury: uranusLongPerihelionCentury_3000,
                         longAscendedNode: uranusLongAscendedNode_3000,
                         longAscendedNodeCentury: uranusLongAscendedNodeCentury_3000,
                         eccentricity: uranusEccentric_3000,
                         eccentricityCentury: uranusEccentricCentury_3000,
                         auDistance: uranusAuDistance_3000,
                         auDistanceCentury: uranusAuDistanceCentury_3000,
                         inclination: uranusInclination_3000,
                         inclinationCentury: uranusInclinationCentury_3000,
                         julianCentury: julianCentury)
        let eccentricUranusInstance = adjustedParameters(julianCentury,uranusInstance,uranusAugmented_b,uranusAugmented_c,uranusAugmented_s,uranusAugmented_f)
        let uranusAUInstance = uranusInstance.auDistance
        let uranusHelioInstanceData = calcHelioCoord(auInstance: uranusAUInstance,attrInstance: uranusInstance,eccAttrInstance: eccentricUranusInstance)
        let uranusHelioEcl = PlanetHelioCoord(helioX: uranusHelioInstanceData.eclipticX, helioY: uranusHelioInstanceData.eclipticY, helioZ: uranusHelioInstanceData.eclipticZ)
        
        
        let neptuneInstance = planetParameters(meanLong: neptuneMeanLong_3000,
                         meanLongCentury: neptuneMeanLongCentury_3000,
                         longPerihelion: neptuneLongPerihelion_3000,
                         longPerihelionCentury: neptuneLongPerihelionCentury_3000,
                         longAscendedNode: neptuneLongAscendedNode_3000,
                         longAscendedNodeCentury: neptuneLongAscendedNodeCentury_3000,
                         eccentricity: neptuneEccentric_3000,
                         eccentricityCentury: neptuneEccentricCentury_3000,
                         auDistance: neptuneAuDistance_3000,
                         auDistanceCentury: neptuneAuDistanceCentury_3000,
                         inclination: neptuneInclination_3000,
                         inclinationCentury: neptuneInclinationCentury_3000,
                         julianCentury: julianCentury)
        let eccentricNeptuneInstance = adjustedParameters(julianCentury,neptuneInstance,neptuneAugmented_b,neptuneAugmented_c,neptuneAugmented_s,neptuneAugmented_f)
        let neptuneAUInstance = neptuneInstance.auDistance
        let neptuneHelioInstanceData = calcHelioCoord(auInstance: neptuneAUInstance,attrInstance: neptuneInstance,eccAttrInstance: eccentricNeptuneInstance)
        let neptuneHelioEcl = PlanetHelioCoord(helioX: neptuneHelioInstanceData.eclipticX, helioY: neptuneHelioInstanceData.eclipticY, helioZ: neptuneHelioInstanceData.eclipticZ)
        
        let plutoInstance = planetParameters(meanLong: plutoMeanLong_3000,
                         meanLongCentury: plutoMeanLongCentury_3000,
                         longPerihelion: plutoLongPerihelion_3000,
                         longPerihelionCentury: plutoLongPerihelionCentury_3000,
                         longAscendedNode: plutoLongAscendedNode_3000,
                         longAscendedNodeCentury: plutoLongAscendedNodeCentury_3000,
                         eccentricity: plutoEccentric_3000,
                         eccentricityCentury: plutoEccentricCentury_3000,
                         auDistance: plutoAuDistance_3000,
                         auDistanceCentury: plutoAuDistanceCentury_3000,
                         inclination: plutoInclination_3000,
                         inclinationCentury: plutoInclinationCentury_3000,
                         julianCentury: julianCentury)
        
        let eccentricPlutoInstance = adjustedParameters(julianCentury,plutoInstance,plutoAugmented_b,plutoAugmented_c,plutoAugmented_s,plutoAugmented_f)
        let plutoAUInstance = plutoInstance.auDistance
        let plutoHelioInstanceData = calcHelioCoord(auInstance: plutoAUInstance,attrInstance: plutoInstance,eccAttrInstance: eccentricPlutoInstance)
        let plutoHelioEcl = PlanetHelioCoord(helioX: plutoHelioInstanceData.eclipticX, helioY: plutoHelioInstanceData.eclipticY, helioZ: plutoHelioInstanceData.eclipticZ)
        
        print("convertGeoCoord  mercury \(convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: mercuryHelioEcl))" )
        let geoMercuryEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: mercuryHelioEcl)
        print("convertGeoCoord venus")
        let geoVenusEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: venusHelioEcl)
        print("convertGeoCoord mars")
        let geoMarsEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: marsHelioEcl)
        print("convertGeoCoord jupiter")
        let geoJupiterEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: jupiterHelioEcl)
        print("convertGeoCoord saturn")
        let geoSaturnEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: saturnHelioEcl)
        print("convertGeoCoord uranus")
        let geoUranusEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: uranusHelioEcl)
        print("convertGeoCoord neptune")
        let geoNeptuneEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: neptuneHelioEcl)
        print("convertGeoCoord pluto")
        let geoPlutoEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: plutoHelioEcl)
        
        
//        nineGeoCoordinates.append(geoMercuryEcl)
//        nineGeoCoordinates.append(geoVenusEcl)
//        nineGeoCoordinates.append(geoMarsEcl)
//        nineGeoCoordinates.append(geoJupiterEcl)
//        nineGeoCoordinates.append(geoSaturnEcl)
//        nineGeoCoordinates.append(geoUranusEcl)
//        nineGeoCoordinates.append(geoNeptuneEcl)
//        nineGeoCoordinates.append(geoPlutoEcl)
        
        
        let mercuryLatLon = convertVectorToCoor(xVec: geoMercuryEcl.geoX, yVec: geoMercuryEcl.geoY, zVec: geoMercuryEcl.geoZ)
        let venusLatLon = convertVectorToCoor(xVec: geoVenusEcl.geoX, yVec: geoVenusEcl.geoY, zVec: geoVenusEcl.geoZ)
        let marsLatLon = convertVectorToCoor(xVec: geoMarsEcl.geoX, yVec: geoMarsEcl.geoY, zVec: geoMarsEcl.geoZ)
        let jupiterLatLon = convertVectorToCoor(xVec: geoJupiterEcl.geoX, yVec: geoJupiterEcl.geoY, zVec: geoJupiterEcl.geoZ)
        let saturnLatLon = convertVectorToCoor(xVec: geoSaturnEcl.geoX, yVec: geoSaturnEcl.geoY, zVec: geoSaturnEcl.geoZ)
        let uranusLatLon = convertVectorToCoor(xVec: geoUranusEcl.geoX, yVec: geoUranusEcl.geoY, zVec: geoUranusEcl.geoZ)
        let neptuneLatLon = convertVectorToCoor(xVec: geoNeptuneEcl.geoX, yVec: geoNeptuneEcl.geoY, zVec: geoNeptuneEcl.geoZ)
        let plutoLatLon = convertVectorToCoor(xVec: geoPlutoEcl.geoX, yVec: geoPlutoEcl.geoY, zVec: geoPlutoEcl.geoZ)
        print("show mercury geo longitude: \(mercuryLatLon)")
        
        var nineGeoLatLon:[GeoLatLon] = [GeoLatLon]()
        
        nineGeoLatLon.append(mercuryLatLon)
        nineGeoLatLon.append(venusLatLon)
        nineGeoLatLon.append(marsLatLon)
        nineGeoLatLon.append(jupiterLatLon)
        nineGeoLatLon.append(saturnLatLon)
        nineGeoLatLon.append(uranusLatLon)
        nineGeoLatLon.append(neptuneLatLon)
        nineGeoLatLon.append(plutoLatLon)

//        nineGeoCoordinates.append(planetGeoCoord(geoX: mercuryHelioEcl.helioX, geoY: mercuryHelioEcl.helioY, geoZ: mercuryHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: venusHelioEcl.helioX, geoY: venusHelioEcl.helioY, geoZ: venusHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: marsHelioEcl.helioX, geoY: marsHelioEcl.helioY, geoZ: marsHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: jupiterHelioEcl.helioX, geoY: jupiterHelioEcl.helioY, geoZ: jupiterHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: saturnHelioEcl.helioX, geoY: saturnHelioEcl.helioY, geoZ: saturnHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: uranusHelioEcl.helioX, geoY: uranusHelioEcl.helioY, geoZ: uranusHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: neptuneHelioEcl.helioX, geoY: neptuneHelioEcl.helioY, geoZ: neptuneHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: plutoHelioEcl.helioX, geoY: plutoHelioEcl.helioY, geoZ: plutoHelioEcl.helioZ) )
        return nineGeoLatLon
//
    }
    
    func calcGeoCoordX(julianCentury:Double) -> [GeoLatLon]{
        
        let earthInstance = planetParameters(meanLong: earthMeanLong_2050,
                         meanLongCentury: earthMeanLongCentury_2050,
                         longPerihelion: earthLongPerihelion_2050,
                         longPerihelionCentury: earthLongPerihelionCentury_2050,
                         longAscendedNode: earthLongAscendedNode_2050,
                         longAscendedNodeCentury: earthLongAscendedNodeCentury_2050,
                         eccentricity: earthEccentric_2050,
                         eccentricityCentury: earthEccentricCentury_2050,
                         auDistance: earthAuDistance_2050,
                         auDistanceCentury: earthAuDistanceCentury_2050,
                         inclination: earthInclination_2050,
                         inclinationCentury: earthInclinationCentury_2050,
                         julianCentury: julianCentury)
        let eccentricEarthInstance = adjustedParameters(julianCentury,earthInstance,0,0,0,0)
        
        let earthAUInstance = earthInstance.auDistance
        let earthHelioInstanceData = calcHelioCoord(auInstance: earthAUInstance,attrInstance: earthInstance,eccAttrInstance: eccentricEarthInstance)
        let earthHelioEcl = PlanetHelioCoord(helioX: earthHelioInstanceData.eclipticX, helioY: earthHelioInstanceData.eclipticY, helioZ: earthHelioInstanceData.eclipticZ)
       print("compute earth helio \(earthHelioEcl)")
        
        
        let mercuryInstance = planetParameters(meanLong: mercuryMeanLong_2050,
                         meanLongCentury: mercuryMeanLongCentury_2050,
                         longPerihelion: mercuryLongPerihelion_2050,
                         longPerihelionCentury: mercuryLongPerihelionCentury_2050,
                         longAscendedNode: mercuryLongAscendedNode_2050,
                         longAscendedNodeCentury: mercuryLongAscendedNodeCentury_2050,
                         eccentricity: mercuryEccentric_2050,
                         eccentricityCentury: mercuryEccentricCentury_2050,
                         auDistance: mercuryAuDistance_2050,
                         auDistanceCentury: mercuryAuDistanceCentury_2050,
                         inclination: mercuryInclination_2050,
                         inclinationCentury: mercuryInclinationCentury_2050,
                         julianCentury: julianCentury)
        let eccentricMercuryInstance = adjustedParameters(julianCentury,mercuryInstance,0,0,0,0)
        let mercuryAUInstance = mercuryInstance.auDistance
        let mercuryHelioInstanceData = calcHelioCoord(auInstance: mercuryAUInstance,attrInstance: mercuryInstance,eccAttrInstance: eccentricMercuryInstance)
        let mercuryHelioEcl = PlanetHelioCoord(helioX: mercuryHelioInstanceData.eclipticX, helioY: mercuryHelioInstanceData.eclipticY, helioZ: mercuryHelioInstanceData.eclipticZ)
        print("compute earth mercury helio \(mercuryHelioEcl)")
        
        let venusInstance = planetParameters(meanLong: venusMeanLong_2050,
                         meanLongCentury: venusMeanLongCentury_2050,
                         longPerihelion: venusLongPerihelion_2050,
                         longPerihelionCentury: venusLongPerihelionCentury_2050,
                         longAscendedNode: venusLongAscendedNode_2050,
                         longAscendedNodeCentury: venusLongAscendedNodeCentury_2050,
                         eccentricity: venusEccentric_2050,
                         eccentricityCentury: venusEccentricCentury_2050,
                         auDistance: venusAuDistance_2050,
                         auDistanceCentury: venusAuDistanceCentury_2050,
                         inclination: venusInclination_2050,
                         inclinationCentury: venusInclinationCentury_2050,
                         julianCentury: julianCentury)
        let eccentricVenusInstance = adjustedParameters(julianCentury,venusInstance,0,0,0,0)
        let venusAUInstance = venusInstance.auDistance
        let venusHelioInstanceData = calcHelioCoord(auInstance: venusAUInstance,attrInstance: venusInstance,eccAttrInstance: eccentricVenusInstance)
        let venusHelioEcl = PlanetHelioCoord(helioX: venusHelioInstanceData.eclipticX, helioY: venusHelioInstanceData.eclipticY, helioZ: venusHelioInstanceData.eclipticZ)
        
        
        let marsInstance = planetParameters(meanLong: marsMeanLong_2050,
                         meanLongCentury: marsMeanLongCentury_2050,
                         longPerihelion: marsLongPerihelion_2050,
                         longPerihelionCentury: marsLongPerihelionCentury_2050,
                         longAscendedNode: marsLongAscendedNode_2050,
                         longAscendedNodeCentury: marsLongAscendedNodeCentury_2050,
                         eccentricity: marsEccentric_2050,
                         eccentricityCentury: marsEccentricCentury_2050,
                         auDistance: marsAuDistance_2050,
                         auDistanceCentury: marsAuDistanceCentury_2050,
                         inclination: marsInclination_2050,
                         inclinationCentury: marsInclinationCentury_2050,
                         julianCentury: julianCentury)
        let eccentricMarsInstance = adjustedParameters(julianCentury,marsInstance,0,0,0,0)
        let marsAUInstance = marsInstance.auDistance
        let marsHelioInstanceData = calcHelioCoord(auInstance: marsAUInstance,attrInstance: marsInstance,eccAttrInstance: eccentricMarsInstance)
        let marsHelioEcl = PlanetHelioCoord(helioX: marsHelioInstanceData.eclipticX, helioY: marsHelioInstanceData.eclipticY, helioZ: marsHelioInstanceData.eclipticZ)
        
        
        let jupiterInstance = planetParameters(meanLong: jupiterMeanLong_2050,
                         meanLongCentury: jupiterMeanLongCentury_2050,
                         longPerihelion: jupiterLongPerihelion_2050,
                         longPerihelionCentury: jupiterLongPerihelionCentury_2050,
                         longAscendedNode: jupiterLongAscendedNode_2050,
                         longAscendedNodeCentury: jupiterLongAscendedNodeCentury_2050,
                         eccentricity: jupiterEccentric_2050,
                         eccentricityCentury: jupiterEccentricCentury_2050,
                         auDistance: jupiterAuDistance_2050,
                         auDistanceCentury: jupiterAuDistanceCentury_2050,
                         inclination: jupiterInclination_2050,
                         inclinationCentury: jupiterInclinationCentury_2050,
                         julianCentury: julianCentury)
        let eccentricJupiterInstance = adjustedParameters(julianCentury,jupiterInstance,0,0,0,0)
        let jupiterAUInstance = jupiterInstance.auDistance
        let jupiterHelioInstanceData = calcHelioCoord(auInstance: jupiterAUInstance,attrInstance: jupiterInstance,eccAttrInstance: eccentricJupiterInstance)
        let jupiterHelioEcl = PlanetHelioCoord(helioX: jupiterHelioInstanceData.eclipticX, helioY: jupiterHelioInstanceData.eclipticY, helioZ: jupiterHelioInstanceData.eclipticZ)
        
        
        let saturnInstance = planetParameters(meanLong: saturnMeanLong_2050,
                         meanLongCentury: saturnMeanLongCentury_2050,
                         longPerihelion: saturnLongPerihelion_2050,
                         longPerihelionCentury: saturnLongPerihelionCentury_2050,
                         longAscendedNode: saturnLongAscendedNode_2050,
                         longAscendedNodeCentury: saturnLongAscendedNodeCentury_2050,
                         eccentricity: saturnEccentric_2050,
                         eccentricityCentury: saturnEccentricCentury_2050,
                         auDistance: saturnAuDistance_2050,
                         auDistanceCentury: saturnAuDistanceCentury_2050,
                         inclination: saturnInclination_2050,
                         inclinationCentury: saturnInclinationCentury_2050,
                         julianCentury: julianCentury)
        let eccentricSaturnInstance = adjustedParameters(julianCentury,saturnInstance,0,0,0,0)
        let saturnAUInstance = saturnInstance.auDistance
        let saturnHelioInstanceData = calcHelioCoord(auInstance: saturnAUInstance,attrInstance: saturnInstance,eccAttrInstance: eccentricSaturnInstance)
        let saturnHelioEcl = PlanetHelioCoord(helioX: saturnHelioInstanceData.eclipticX, helioY: saturnHelioInstanceData.eclipticY, helioZ: saturnHelioInstanceData.eclipticZ)
        
        
        let uranusInstance = planetParameters(meanLong: uranusMeanLong_2050,
                         meanLongCentury: uranusMeanLongCentury_2050,
                         longPerihelion: uranusLongPerihelion_2050,
                         longPerihelionCentury: uranusLongPerihelionCentury_2050,
                         longAscendedNode: uranusLongAscendedNode_2050,
                         longAscendedNodeCentury: uranusLongAscendedNodeCentury_2050,
                         eccentricity: uranusEccentric_2050,
                         eccentricityCentury: uranusEccentricCentury_2050,
                         auDistance: uranusAuDistance_2050,
                         auDistanceCentury: uranusAuDistanceCentury_2050,
                         inclination: uranusInclination_2050,
                         inclinationCentury: uranusInclinationCentury_2050,
                         julianCentury: julianCentury)
        let eccentricUranusInstance = adjustedParameters(julianCentury,uranusInstance,0,0,0,0)
        let uranusAUInstance = uranusInstance.auDistance
        let uranusHelioInstanceData = calcHelioCoord(auInstance: uranusAUInstance,attrInstance: uranusInstance,eccAttrInstance: eccentricUranusInstance)
        let uranusHelioEcl = PlanetHelioCoord(helioX: uranusHelioInstanceData.eclipticX, helioY: uranusHelioInstanceData.eclipticY, helioZ: uranusHelioInstanceData.eclipticZ)
        
        
        let neptuneInstance = planetParameters(meanLong: neptuneMeanLong_2050,
                         meanLongCentury: neptuneMeanLongCentury_2050,
                         longPerihelion: neptuneLongPerihelion_2050,
                         longPerihelionCentury: neptuneLongPerihelionCentury_2050,
                         longAscendedNode: neptuneLongAscendedNode_2050,
                         longAscendedNodeCentury: neptuneLongAscendedNodeCentury_2050,
                         eccentricity: neptuneEccentric_2050,
                         eccentricityCentury: neptuneEccentricCentury_2050,
                         auDistance: neptuneAuDistance_2050,
                         auDistanceCentury: neptuneAuDistanceCentury_2050,
                         inclination: neptuneInclination_2050,
                         inclinationCentury: neptuneInclinationCentury_2050,
                         julianCentury: julianCentury)
        let eccentricNeptuneInstance = adjustedParameters(julianCentury,neptuneInstance,0,0,0,0)
        let neptuneAUInstance = neptuneInstance.auDistance
        let neptuneHelioInstanceData = calcHelioCoord(auInstance: neptuneAUInstance,attrInstance: neptuneInstance,eccAttrInstance: eccentricNeptuneInstance)
        let neptuneHelioEcl = PlanetHelioCoord(helioX: neptuneHelioInstanceData.eclipticX, helioY: neptuneHelioInstanceData.eclipticY, helioZ: neptuneHelioInstanceData.eclipticZ)
        
        let plutoInstance = planetParameters(meanLong: plutoMeanLong_2050,
                         meanLongCentury: plutoMeanLongCentury_2050,
                         longPerihelion: plutoLongPerihelion_2050,
                         longPerihelionCentury: plutoLongPerihelionCentury_2050,
                         longAscendedNode: plutoLongAscendedNode_2050,
                         longAscendedNodeCentury: plutoLongAscendedNodeCentury_2050,
                         eccentricity: plutoEccentric_2050,
                         eccentricityCentury: plutoEccentricCentury_2050,
                         auDistance: plutoAuDistance_2050,
                         auDistanceCentury: plutoAuDistanceCentury_2050,
                         inclination: plutoInclination_2050,
                         inclinationCentury: plutoInclinationCentury_2050,
                         julianCentury: julianCentury)
        let eccentricPlutoInstance = adjustedParameters(julianCentury,plutoInstance,0,0,0,0)
        let plutoAUInstance = plutoInstance.auDistance
        let plutoHelioInstanceData = calcHelioCoord(auInstance: plutoAUInstance,attrInstance: plutoInstance,eccAttrInstance: eccentricPlutoInstance)
        let plutoHelioEcl = PlanetHelioCoord(helioX: plutoHelioInstanceData.eclipticX, helioY: plutoHelioInstanceData.eclipticY, helioZ: plutoHelioInstanceData.eclipticZ)
        
        print("convertGeoCoord  mercury \(convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: mercuryHelioEcl))" )
        let geoMercuryEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: mercuryHelioEcl)
        print("convertGeoCoord venus")
        let geoVenusEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: venusHelioEcl)
        print("convertGeoCoord mars")
        let geoMarsEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: marsHelioEcl)
        print("convertGeoCoord jupiter")
        let geoJupiterEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: jupiterHelioEcl)
        print("convertGeoCoord saturn")
        let geoSaturnEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: saturnHelioEcl)
        print("convertGeoCoord uranus")
        let geoUranusEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: uranusHelioEcl)
        print("convertGeoCoord neptune")
        let geoNeptuneEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: neptuneHelioEcl)
        print("convertGeoCoord pluto")
        let geoPlutoEcl = convertGeoCoord(earthCoord: earthHelioEcl, geoCoord: plutoHelioEcl)
        
        
//        nineGeoCoordinates.append(geoMercuryEcl)
//        nineGeoCoordinates.append(geoVenusEcl)
//        nineGeoCoordinates.append(geoMarsEcl)
//        nineGeoCoordinates.append(geoJupiterEcl)
//        nineGeoCoordinates.append(geoSaturnEcl)
//        nineGeoCoordinates.append(geoUranusEcl)
//        nineGeoCoordinates.append(geoNeptuneEcl)
//        nineGeoCoordinates.append(geoPlutoEcl)
        
        
        let mercuryLatLon = convertVectorToCoor(xVec: geoMercuryEcl.geoX, yVec: geoMercuryEcl.geoY, zVec: geoMercuryEcl.geoZ)
        let venusLatLon = convertVectorToCoor(xVec: geoVenusEcl.geoX, yVec: geoVenusEcl.geoY, zVec: geoVenusEcl.geoZ)
        let marsLatLon = convertVectorToCoor(xVec: geoMarsEcl.geoX, yVec: geoMarsEcl.geoY, zVec: geoMarsEcl.geoZ)
        let jupiterLatLon = convertVectorToCoor(xVec: geoJupiterEcl.geoX, yVec: geoJupiterEcl.geoY, zVec: geoJupiterEcl.geoZ)
        let saturnLatLon = convertVectorToCoor(xVec: geoSaturnEcl.geoX, yVec: geoSaturnEcl.geoY, zVec: geoSaturnEcl.geoZ)
        let uranusLatLon = convertVectorToCoor(xVec: geoUranusEcl.geoX, yVec: geoUranusEcl.geoY, zVec: geoUranusEcl.geoZ)
        let neptuneLatLon = convertVectorToCoor(xVec: geoNeptuneEcl.geoX, yVec: geoNeptuneEcl.geoY, zVec: geoNeptuneEcl.geoZ)
        let plutoLatLon = convertVectorToCoor(xVec: geoPlutoEcl.geoX, yVec: geoPlutoEcl.geoY, zVec: geoPlutoEcl.geoZ)
        print("show mercury geo longitude: \(mercuryLatLon)")
        
        var nineGeoLatLon:[GeoLatLon] = [GeoLatLon]()
        nineGeoLatLon.append(mercuryLatLon)
        nineGeoLatLon.append(venusLatLon)
        nineGeoLatLon.append(marsLatLon)
        nineGeoLatLon.append(jupiterLatLon)
        nineGeoLatLon.append(saturnLatLon)
        nineGeoLatLon.append(uranusLatLon)
        nineGeoLatLon.append(neptuneLatLon)
        nineGeoLatLon.append(plutoLatLon)

//        nineGeoCoordinates.append(planetGeoCoord(geoX: mercuryHelioEcl.helioX, geoY: mercuryHelioEcl.helioY, geoZ: mercuryHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: venusHelioEcl.helioX, geoY: venusHelioEcl.helioY, geoZ: venusHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: marsHelioEcl.helioX, geoY: marsHelioEcl.helioY, geoZ: marsHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: jupiterHelioEcl.helioX, geoY: jupiterHelioEcl.helioY, geoZ: jupiterHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: saturnHelioEcl.helioX, geoY: saturnHelioEcl.helioY, geoZ: saturnHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: uranusHelioEcl.helioX, geoY: uranusHelioEcl.helioY, geoZ: uranusHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: neptuneHelioEcl.helioX, geoY: neptuneHelioEcl.helioY, geoZ: neptuneHelioEcl.helioZ) )
//        nineGeoCoordinates.append(planetGeoCoord(geoX: plutoHelioEcl.helioX, geoY: plutoHelioEcl.helioY, geoZ: plutoHelioEcl.helioZ) )
//
        return nineGeoLatLon
    }
    
    func convertGeoCoord(earthCoord:PlanetHelioCoord,geoCoord:PlanetHelioCoord) -> PlanetGeoCoord{
        
        var geo = PlanetGeoCoord(geoX: 0, geoY: 0, geoZ: 0)
        
        geo.geoX = geoCoord.helioX - earthCoord.helioX
        geo.geoY = geoCoord.helioY - earthCoord.helioY
        geo.geoZ = geoCoord.helioZ - earthCoord.helioZ
        
        return geo
    }
    
    func convertVectorToCoor(xVec:Double, yVec:Double, zVec:Double) -> GeoLatLon {
        
        var longitude = atan(yVec/xVec) * 180 / .pi
        var latitude = atan(zVec/sqrt(xVec*xVec + yVec*yVec)) * 180 / .pi
        
        if longitude < 0 {
            longitude += 360
        }else if(longitude > 360){
            
            longitude = longitude.truncatingRemainder(dividingBy: 360)
        }
        
        if latitude < 0 {
            latitude += 360
        }else if(latitude > 360){
            
            latitude = latitude.truncatingRemainder(dividingBy: 360)
        }
        
        return GeoLatLon(longitude: longitude, latitude: latitude)
    }
}
