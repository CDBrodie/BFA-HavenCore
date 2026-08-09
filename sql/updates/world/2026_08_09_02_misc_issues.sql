UPDATE creature_template SET faction = 35 WHERE entry = 42413;
UPDATE creature_template SET faction = 35 WHERE entry = 42385;
INSERT INTO `bfa_world`.`npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES ('42260', '46598', '1', '0'); 
DELETE FROM `vehicle_seat` WHERE `VerifiedBuild`>0 AND `ID`=8030;  
INSERT INTO `vehicle_seat`  
    (`ID`, `AttachmentOffsetX`, `AttachmentOffsetY`, `AttachmentOffsetZ`, `CameraOffsetX`, `CameraOffsetY`, `CameraOffsetZ`,  
     `Flags`, `FlagsB`, `FlagsC`, `AttachmentID`, `EnterPreDelay`, `EnterSpeed`, `EnterGravity`, `EnterMinDuration`, `EnterMaxDuration`,  
     `EnterMinArcHeight`, `EnterMaxArcHeight`, `EnterAnimStart`, `EnterAnimLoop`, `RideAnimStart`, `RideAnimLoop`,  
     `RideUpperAnimStart`, `RideUpperAnimLoop`, `ExitPreDelay`, `ExitSpeed`, `ExitGravity`, `ExitMinDuration`, `ExitMaxDuration`,  
     `ExitMinArcHeight`, `ExitMaxArcHeight`, `ExitAnimStart`, `ExitAnimLoop`, `ExitAnimEnd`, `VehicleEnterAnim`, `VehicleEnterAnimBone`,  
     `VehicleExitAnim`, `VehicleExitAnimBone`, `VehicleRideAnimLoop`, `VehicleRideAnimLoopBone`, `PassengerAttachmentID`,  
     `PassengerYaw`, `PassengerPitch`, `PassengerRoll`, `VehicleEnterAnimDelay`, `VehicleExitAnimDelay`, `VehicleAbilityDisplay`,  
     `EnterUISoundID`, `ExitUISoundID`, `UiSkinFileDataID`, `CameraEnteringDelay`, `CameraEnteringDuration`, `CameraExitingDelay`,  
     `CameraExitingDuration`, `CameraPosChaseRate`, `CameraFacingChaseRate`, `CameraEnteringZoom`, `CameraSeatZoomMin`,  
     `CameraSeatZoomMax`, `EnterAnimKitID`, `RideAnimKitID`, `ExitAnimKitID`, `VehicleEnterAnimKitID`, `VehicleRideAnimKitID`,  
     `VehicleExitAnimKitID`, `CameraModeID`, `VerifiedBuild`)  
VALUES  
    (8030, 0, 0, 0, 0, 0, 0,  
     0x4000880b, 0x2000300, 0x0, 21, 0, 7, 19.29000091553, 0, 0,  
     1, 4, 37, 38, -1, 91,  
     128, 123, 0, 7, 19.29000091553, 0, 0,  
     1, 4, 37, 38, 39, -1, -1,  
     -1, -1, -1, -1, -1,  
     0, 0, 0, 0, 0, 2,  
     0, 0, 534043, 0, 0, 0,  
     0, 20, 20, 0, 0,  
     0, 0, 0, 0, 0, 0,  
     0, 0, 35662);
	 
	 
UPDATE `bfa_world`.`quest_template` SET `RewardSpell` = '0' WHERE `ID` = '12619'; 