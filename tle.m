function [str] = tle(a,e,I,Omega,omega,upsilon,mu)
    % período orbital
    P = 2*pi*sqrt(a^3/mu);
    % conversao
    rad = 180/pi;
    % meam motion, revs por dia
    revs = (24*3600)/P;
    nOrbs = 00000;
    checksum = 8;
    % anomalia media M_0
    M_0 = Mean_0(e, upsilon);

    fileID = fopen('TLE_LGNC.txt','w');
    str = sprintf('TLE_LGNC\n');
    str = [str sprintf('1 15429U 84124A   18184.92029730 -.00001152  00000-0  00000-0 0  9994\n')];
    str = [str sprintf('2 15429 %8.4f %8.4f %d %8.4f %8.4f %11.8f%05d%d\n',I*rad,Omega*rad,int32(e*1e7),omega*rad,M_0*rad,revs,nOrbs, checksum)];
    fprintf(fileID,str);
    fclose(fileID);
end