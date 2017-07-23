clc
clear

image = imread('/home/anupam/Desktop/images.jpeg');


[newimage , compressed] = JPEGAlgorithm(image);
compressed = uint8(compressed);
whos image newimage compressed;