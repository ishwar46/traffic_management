class CameraData {
  int cameraId;
  String datetime;
  String objectId;

  CameraData(this.cameraId, this.datetime, this.objectId);

  // Add a factory constructor to create an instance of CameraData from a Map
  factory CameraData.fromMap(Map<dynamic, dynamic> map) {
    return CameraData(
      map['camera_id'],
      map['datetime'],
      map['object_id'],
    );
  }
}
