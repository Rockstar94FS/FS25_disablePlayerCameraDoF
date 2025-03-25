--
-- DisableCameraDof
--
-- @author Rockstar
-- @date 01/12/2024
--


DisableDof = {}

function DisableDof:new()
	g_messageCenter:subscribeOneshot(MessageType.CURRENT_MISSION_LOADED, DisableDof.onStartMission, self)
end

function DisableDof:onStartMission()
	if g_localPlayer == nil or g_localPlayer.camera == nil or g_cameraManager == nil or g_cameraManager.cameraInfo == nil then
		return
	end

	local playerCamera = g_localPlayer.camera
	local firstPersonCamera = playerCamera.firstPersonCamera
	local thirdPersonCamera = playerCamera.thirdPersonCamera

	local firstPersonCameraInfo = g_cameraManager.cameraInfo[firstPersonCamera]
	local thirdPersonCameraInfo = g_cameraManager.cameraInfo[thirdPersonCamera]

	if firstPersonCameraInfo ~= nil and thirdPersonCameraInfo ~= nil then
		thirdPersonCameraInfo.dofInfo = firstPersonCameraInfo.dofInfo
	end
end

DisableDof:new()