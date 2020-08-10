function TracerSurFenetre (chiffre)
close all
global coord
h = figure('WindowButtonDownFcn',@wbdcb);
ah = axes('DrawMode','fast');
axis([0,1,0,1]); 
coordonnees = [];   
index = 1;
title(...
    'Un clic gauche pour débuter, un droit pour signaler la fin du tracé')
    function wbdcb(src,evnt)
        clic_souris = get(src,'SelectionType');
        if(strcmp(clic_souris,'normal'))
            set(src,'pointer','circle')
            set(src,'WindowButtonMotionFcn',@dessiner)
            set(src,'WindowButtonUpFcn',@test)
        end
        function dessiner(src,evnt)
            cp = get(ah,'CurrentPoint');
            coordonnees(index,:) = cp(1,1:2);
            plot(coordonnees(index,1),coordonnees(index,2));
            hold on
            axis([0,1,0,1])
            title('Un clic gauche pour débuter, un droit pour signaler la fin')
            index = index +1;
        end
        function test(src,evnt)        
            if strcmp(get(src,'SelectionType'),'alt')
                disp ('ddecd')
                set(src,'Pointer','arrow')
                set(src,'WindowButtonMotionFcn','')
                set(src,'WindowButtonUpFcn','')
                plot(coordonnees(:,1),coordonnees(:,2));
                %décommenter pour ne garder que le chiffre manuscrit sur l'image
                axis off ; title('')
                hold off ;
                nom = 'coord_';
                coord{end+1}.coord = coordonnees
                coord{end}.chif = chiffre;
             %   saveas(h,'SvgChiffre','jpg')%sauvegarde de l'image
            else
                return
            end
        end
    end
end