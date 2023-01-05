clc ;clear;
x0=0.377;
y0=0.3738;
u0=0.99;
X(1)=x0;Y(1)=y0;u=u0;
%每迭代一次生成8bits，NIST测试需要产生10^8Bits
%因此需要迭代12500000次
M=12500001;

for k=1:M-1
    Y(k+1)=u*sin(pi*Y(k));
end

for k=1:M-1

   p1(k)=floor(mod(X(k)*10^10,2^8));
   X(k+1)=4*(1-0.1*Y(k+1))*X(k)*(1-X(k));

end
% floor(mod(seq_R*10^10,256));
% for k=1:M
%     p1(k)=mod(floor((X1(k)*X2(k))/2^16+X3(k)/10^7),2^8);
%     %p1(k)=mod(X3(k),2^8);
%     X1(k+1) = AA(1,1)*X1(k) +AA(1,2)*X2(k) +AA(1,3)*X3(k) +mod(B1*X1(k),E1);
%     X2(k+1) = AA(2,1)*X1(k) +AA(2,2)*X2(k) +AA(2,3)*X3(k) +mod(B2*X2(k),E2);
%     X3(k+1) = AA(3,1)*X1(k) +AA(3,2)*X2(k) +AA(3,3)*X3(k) +mod(B3*X3(k),E3);
% end
%%
% 将产生的二进制随机数写入txt文档，用于NIST测试
p2=dec2bin(p1);
fid = fopen('NIST.txt','wt');
fprintf(fid,'%c',p2);
fclose(fid);