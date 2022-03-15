function Step4b_Plot_for_Level_Set
    StructNumber1 = 11; % 11: AR   12: AB   21: SR   22: SB   31: FR   32: FB   If the final digit is zero, structure2 is not displayed.
    StructNumber2 = 12;
    
    isOutput=0;
    outputfilename='Overlapped_Gyroid';
    
    if isOutput==1
        fig = figure;
        %if (PlotType==2) || (PlotType==3)
            %fig.Renderer='painters';
        %end
        fig.Position = [0,0,1920,1080];
    end
    
    AR_Color = [200,0,0]/255;%[1,0,0];%[1,0.5,0.3];
    AR_FaceAlpha = 1;
    AR_LSf = 0.358;
    AB_Color = [0,0,200]/255;%[0,0,1];%[0.3,0.5,1];
    AB_FaceAlpha = 1;
    AB_LSf = 0.358;
    SR_Color = [200,0,0]/255;
    SR_FaceAlpha = 1;
    SR_LSf = 0.35815;
    SB_Color = [0,0,200]/255;
    SB_FaceAlpha = 1;
    SB_LSf = 0.3559;
    FR_Color = [200,0,0]/255;
    FR_FaceAlpha = 1;
    FR_LSf = 0.3739;
    FB_Color = [0,0,200]/255;
    FB_FaceAlpha = 1;
    FB_LSf = 0.3193; %0.3629;
	AR_fname = 'LS_structure_2_Affine_cp0520a.txt';
	AB_fname = 'LS_structure_1_Affine_cp0520a.txt';
    SR_fname = 'LS_structure_1_Slow_cp0520b.txt';
    SB_fname = 'LS_structure_2_Slow_cp0520b.txt';
    FR_fname = 'LS_structure_1_Fast_cp0512.txt';
    FB_fname = 'LS_structure_2_Fast_cp0512.txt';
    
    if StructNumber1 == 11
        Color_Structure_1 = AR_Color;
        FaceAlpha_Structure_1 = AR_FaceAlpha;
        fname1 = AR_fname;
        LSf = AR_LSf;
    elseif StructNumber1 == 12
        Color_Structure_1 = AB_Color;
        FaceAlpha_Structure_1 = AB_FaceAlpha;
        fname1 = AB_fname;
        LSf = AB_LSf;
    elseif StructNumber1 == 21
        Color_Structure_1 = SR_Color;
        FaceAlpha_Structure_1 = SR_FaceAlpha;
        fname1 = SR_fname;
        LSf = SR_LSf;
    elseif StructNumber1 == 22
        Color_Structure_1 = SB_Color;
        FaceAlpha_Structure_1 = SB_FaceAlpha;
        fname1 = SB_fname;
        LSf = SB_LSf;
    elseif StructNumber1 == 31
        Color_Structure_1 = FR_Color;
        FaceAlpha_Structure_1 = FR_FaceAlpha;
        fname1 = FR_fname;
        LSf = FR_LSf;
    elseif StructNumber1 == 32
        Color_Structure_1 = FB_Color;
        FaceAlpha_Structure_1 = FB_FaceAlpha;
        fname1 = FB_fname;
        LSf = FB_LSf;
    end
    
    if StructNumber2 == 11
        Color_Structure_2 = AR_Color;
        FaceAlpha_Structure_2 = AR_FaceAlpha;
        fname2 = AR_fname;
        LSg = AR_LSf;
    elseif StructNumber2 == 12
        Color_Structure_2 = AB_Color;
        FaceAlpha_Structure_2 = AB_FaceAlpha;
        fname2 = AB_fname;
        LSg = AB_LSf;
    elseif StructNumber2 == 21
        Color_Structure_2 = SR_Color;
        FaceAlpha_Structure_2 = SR_FaceAlpha;
        fname2 = SR_fname;
        LSg = SR_LSf;
    elseif StructNumber2 == 22
        Color_Structure_2 = SB_Color;
        FaceAlpha_Structure_2 = SB_FaceAlpha;
        fname2 = SB_fname;
        LSg = SB_LSf;
    elseif StructNumber2 == 31
        Color_Structure_2 = FR_Color;
        FaceAlpha_Structure_2 = FR_FaceAlpha;
        fname2 = FR_fname;
        LSg = FR_LSf;
    elseif StructNumber2 == 32
        Color_Structure_2 = FB_Color;
        FaceAlpha_Structure_2 = FB_FaceAlpha;
        fname2 = FB_fname;
        LSg = FB_LSf;
    end
    
    hkl_data_1 = load(fname1);
    
    hh_1 = hkl_data_1(:,1);
    kk_1 = hkl_data_1(:,2);
    ll_1 = hkl_data_1(:,3);
    a_hkl_1 = hkl_data_1(:,4);
    b_hkl_1 = hkl_data_1(:,5);
    
if round(10*(StructNumber2/10-round(StructNumber2/10)))~=0.0    
    hkl_data_2 = load(fname2);
    
    hh_2 = hkl_data_2(:,1);
    kk_2 = hkl_data_2(:,2);
    ll_2 = hkl_data_2(:,3);
    a_hkl_2 = hkl_data_2(:,4);
    b_hkl_2 = hkl_data_2(:,5);
end

    aaa = 115.3005;
    
    x_period = 2;
    y_period = 2;
    z_period = 2;
    
    [xx,yy,zz] = meshgrid(0:(pi/100):x_period*pi, 0:(pi/100):y_period*pi, 0:(pi/100):z_period*pi);
    FFF=0.5*ones(3,3)-eye(3,3);
    NN=size(xx);
    for i=1:1:NN(1)
        for j=1:1:NN(2)
            for k=1:1:NN(3)
                RRR=FFF*[xx(i,j,k),yy(i,j,k),zz(i,j,k)]';
                xx(i,j,k)=RRR(1);
                yy(i,j,k)=RRR(2);
                zz(i,j,k)=RRR(3);
            end
        end
    end
    xx=aaa/(2*pi)*xx;%(xx-0.21*2*pi);
    yy=aaa/(2*pi)*yy;
    zz=aaa/(2*pi)*zz;
    xxC = xx;
    yyC = yy;
    zzC = zz;
    %xxC=xx-(0.37)*aaa;
    %yyC=yy-(-0.40)*aaa;
    %zzC=zz-(-0.0730)*aaa;
    
    IIf = 0;
    for i=1:1:size(hkl_data_1,1)
        IIf = IIf + a_hkl_1(i)*cos(2*pi/aaa*(hh_1(i)*xxC + kk_1(i)*yyC + ll_1(i)*zzC)) + b_hkl_1(i)*sin(2*pi/aaa*(hh_1(i)*xxC + kk_1(i)*yyC + ll_1(i)*zzC));
    end
    isosurf1=patch(isosurface(xx,yy,zz,IIf,LSf));
    isosurf1.FaceColor = Color_Structure_1;%'yellow';
    isosurf1.EdgeColor = 'none';
    isosurf1.FaceAlpha = FaceAlpha_Structure_1;
    isosurf1.AmbientStrength = 0.35;
    isosurf1.DiffuseStrength = 0.8;
    isosurf1.SpecularStrength = 0.9;
    isosurf1.SpecularExponent = 25;
    isocap1=patch(isocaps(xx,yy,zz,IIf,LSf));
    isocap1.FaceColor = Color_Structure_1;%'yellow';
    isocap1.EdgeColor = 'none';
    isocap1.FaceAlpha = FaceAlpha_Structure_1;
    isocap1.AmbientStrength = 0.35;
    isocap1.DiffuseStrength = 0.8;
    isocap1.SpecularStrength = 0.9;
    isocap1.SpecularExponent = 25;
    hold on
    
if round(10*(StructNumber2/10-round(StructNumber2/10)))~=0.0
    IIf = 0;
    for i=1:1:size(hkl_data_2,1)
        IIf = IIf + a_hkl_2(i)*cos(2*pi/aaa*(hh_2(i)*xxC + kk_2(i)*yyC + ll_2(i)*zzC)) + b_hkl_2(i)*sin(2*pi/aaa*(hh_2(i)*xxC + kk_2(i)*yyC + ll_2(i)*zzC));
    end
    isosurf2=patch(isosurface(xx,yy,zz,IIf,LSg));
    %isonormals(xx,yy,zz,IIf,isosurf1);
    isosurf2.FaceColor = Color_Structure_2;%'blue';
    isosurf2.EdgeColor = 'none';
    isosurf2.FaceAlpha = FaceAlpha_Structure_2;
    isosurf2.AmbientStrength = 0.35;
    isosurf2.DiffuseStrength = 0.8;
    isosurf2.SpecularStrength = 0.9;
    isosurf2.SpecularExponent = 25;
    isocap2=patch(isocaps(xx,yy,zz,IIf,LSg));
    isocap2.FaceColor = Color_Structure_2;%'blue';
    isocap2.EdgeColor = 'none';
    isocap2.FaceAlpha = FaceAlpha_Structure_2;
    isocap2.AmbientStrength = 0.35;
    isocap2.DiffuseStrength = 0.8;
    isocap2.SpecularStrength = 0.9;
    isocap2.SpecularExponent = 25;
    hold on
end    
    
    L1 = 1.01* 0.5*aaa*[-1,1,1];
    L2 = 1.01* 0.5*aaa*[1,-1,1];
    L3 = 1.01* 0.5*aaa*[1,1,-1];
    boxX=[0,          0,          0,          0,          0,          0,          L1(1),            L1(1),            L2(1),            L2(1),            L3(1),            L3(1);
          L1(1),      L1(1)+L2(1),L2(1),      L2(1)+L3(1),L3(1),      L3(1)+L1(1),L1(1)+L2(1),      L1(1)+L2(1)+L3(1),L2(1)+L3(1),      L2(1)+L3(1)+L1(1),L3(1)+L1(1),      L3(1)+L1(1)+L2(1);
          L1(1)+L2(1),L2(1),      L2(1)+L3(1),L3(1),      L3(1)+L1(1),L1(1),      L1(1)+L2(1)+L3(1),L1(1)+L3(1),      L2(1)+L3(1)+L1(1),L2(1)+L1(1),      L3(1)+L1(1)+L2(1),L3(1)+L2(1)];
    boxY=[0,          0,          0,          0,          0,          0,          L1(2),            L1(2),            L2(2),            L2(2),            L3(2),            L3(2);
          L1(2),      L1(2)+L2(2),L2(2),      L2(2)+L3(2),L3(2),      L3(2)+L1(2),L1(2)+L2(2),      L1(2)+L2(2)+L3(2),L2(2)+L3(2),      L2(2)+L3(2)+L1(2),L3(2)+L1(2),      L3(2)+L1(2)+L2(2);
          L1(2)+L2(2),L2(2),      L2(2)+L3(2),L3(2),      L3(2)+L1(2),L1(2),      L1(2)+L2(2)+L3(2),L1(2)+L3(2),      L2(2)+L3(2)+L1(2),L2(2)+L1(2),      L3(2)+L1(2)+L2(2),L3(2)+L2(2)];
    boxZ=[0,          0,          0,          0,          0,          0,          L1(3),            L1(3),            L2(3),            L2(3),            L3(3),            L3(3);
          L1(3),      L1(3)+L2(3),L2(3),      L2(3)+L3(3),L3(3),      L3(3)+L1(3),L1(3)+L2(3),      L1(3)+L2(3)+L3(3),L2(3)+L3(3),      L2(3)+L3(3)+L1(3),L3(3)+L1(3),      L3(3)+L1(3)+L2(3);
          L1(3)+L2(3),L2(3),      L2(3)+L3(3),L3(3),      L3(3)+L1(3),L1(3),      L1(3)+L2(3)+L3(3),L1(3)+L3(3),      L2(3)+L3(3)+L1(3),L2(3)+L1(3),      L3(3)+L1(3)+L2(3),L3(3)+L2(3)];
    boxinfo=patch(boxX,boxY,boxZ,[0.7,0.7,0.7]);
    boxinfo.EdgeColor= 'none';
    boxinfo.FaceAlpha = 0.1;
    boxinfo.AmbientStrength = 0.35;
    boxinfo.DiffuseStrength = 0.8;
    boxinfo.SpecularStrength = 0.9;
    boxinfo.SpecularExponent = 25;
	
    camlight(-10,-20);
    camlight(90,30);
    camlight(0,90);
%    camlight;
    %camva(8);
    %axis image;
    axis equal
    %xlim([min(min(Verts(:,1))), max(max(Verts(:,1)))]);
    %ylim([min(min(Verts(:,2))), max(max(Verts(:,2)))]);
    %zlim([min(min(Verts(:,3))), max(max(Verts(:,3)))]);
    %[max(max(Verts)), max(max(Face_blue)), max(max(Face_red))]
    %min(min(Verts))
    %view([170,14]);
    %view([1,0,0]);
    %view([93,28]);
    %viewvar = [93,28];
    viewvar = [79,45];
    %if round(10*(StructNumber1/10-round(StructNumber1/10)))==2
    %    if (round(10*(StructNumber2/10-round(StructNumber2/10)))==2)||(round(10*(StructNumber2/10-round(StructNumber2/10)))==0.0)
    %        viewvar=[79,45];
    %    end
    %end
    view(viewvar);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    axis off
    lighting gouraud
    
    if isOutput==1
        print([outputfilename,'_',num2str(StructNumber1),'_',num2str(StructNumber2)],'-dpng','-r600');
    end
    
end
