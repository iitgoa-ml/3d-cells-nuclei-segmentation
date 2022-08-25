clear all; close all; clc;

addpath('E:\wrkspce\nucleus_shape\geom3d\geom3d');
addpath('E:\wrkspce\nucleus_shape\geom3d\mesh3d');
addpath('E:\wrkspce\nucleus_shape\geom2d');

% Intersect a cube by a plane
[v f] = createCube; v = v * 10;
plane = createPlane([5 5 5], [3 4 5]);
% draw the primitives
figure; hold on; set(gcf, 'renderer', 'opengl');
axis([-10 20 -10 20 -10 20]); view(3);
drawMesh(v, f); drawPlane3d(plane);
% compute intersection polygon
polys = intersectPlaneMesh(plane, v, f);
drawPolygon3d(polys, 'LineWidth', 2);