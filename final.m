clc;
disp('Implementation of RSA Algorithm for Image Encryption');
clear all;
close all;
p = input('\nEnter the value of p: ');
q = input('\nEnter the value of q: ');
start=tic;
[Pk,Phi,d,e] = intialize(p,q);
M=imread('James Rodriguez.jpg');
N=rgb2gray(M);
figure(1);
imshow(N);
O=mod(N,256);
P=double(O);
[x,y]=size(P);
c=P;

% % %Encryption
fprintf('\nEncrypting...\n\n');
for j= 1:x
    for i=1:y
        enc(j,i)= crypt(c(j,i),Pk,e); 
    end
end
cipher=mod(enc,256);
fprintf('Encryption finished\n\n');
figure(2);
imshow(uint8(cipher));

% % %Decryption
fprintf('Decrypting...\n\n');
for j= 1:x
    for i= 1:y
        dec(j,i)= crypt(enc(j,i),Pk,d); 
    end
end
dec=mod(dec,256);
fprintf('Decryption finished\n\n');
figure(3);
imshow(uint8(dec));
stop=toc(start);
fprintf('Elapsed time= %f\n',stop);