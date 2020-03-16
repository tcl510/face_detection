import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;


OpenCV opencv;
OpenCV opencv2;
Rectangle[] faces;
Rectangle[] nose;
Capture video;

int scl = 1;

void setup() {
  size(1280, 720);
  frameRate(30);
  opencv = new OpenCV(this, width/scl, height/scl);
  opencv2 = new OpenCV(this, width/scl, height/scl);
  video = new Capture(this, width/scl, height/scl);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  opencv2.loadCascade(OpenCV.CASCADE_NOSE);  
  video.start();
  
}

ellipse[] nose_bubble;
rect[] face_square;


void draw() {
  //scale(scl);
  opencv.loadImage(video);
  opencv2.loadImage(video);
  if (video.available() == true){
    video.read();
  }
  image(video, 0, 0, width,height);
  faces = opencv.detect();
  face_square = rectangleToRect(faces);
  nose = opencv2.detect();
  nose_bubble = rectangleToEllipse(nose);




  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  //for (int i = 0; i < faces.length; i++) {
  //  rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  //  for (int z = 0; z < nose.length; z++) {
  //    nose_bubble.size = new PVector(nose[z].width, nose[z].height);
  //    //nose_bubble.moveTo(nose[z].x+ nose[z].width/2, nose[z].y + nose[z].height/2);
  //  rect(nose[z].x, nose[z].y, nose[z].width, nose[z].height);
  //}
  //}
  
  for (rect i: face_square){
    i.draw();
  //  for (ellipse x: nose_bubble){
  //    if (i.collision(x)){
  //      x.draw();
  //    }
  //}
  }
      for (ellipse x: nose_bubble){
      //if (i.collision(x)){
        x.draw();
      //}
  }
  
  
  ellipseMode(CORNER);
  //nose_bubble.draw();
}
