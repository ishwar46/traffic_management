class CameraData {
  int cameraId;
  String datetime;
  String objectId;

  CameraData(this.cameraId, this.datetime, this.objectId);

  factory CameraData.fromMap(Map<dynamic, dynamic> map) {
    return CameraData(
      map['camera_id'],
      map['datetime'],
      map['object_id'],
    );
  }
}
