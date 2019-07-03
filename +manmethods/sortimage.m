function diams_by_img = sortimage(rawimgs,imgids,aggids,rows)
% Reads the ID and clusters all corresponding primary particles belonging 
% to the Image ID (Image File) into separate entries in the 
% diams_by_img array.
%
% A primary particle in this context is a result pair: primary particle
% diameter and its aggregate identifier.
%
% rawimgs:  Set of raw unsorted diameters, image ID's, and aggregate ID's
%           pertaining to some aggregate in some image
% imgids:   Set of image ID's corresponding to the raw unsorted diameters
% aggids:   Set of aggregate identifiers corresponding to the raw unsorted
%           diameters
% rows:     Number of rows of important information in rawimgs

% diams_by_img will be an array of primary particle groups sorted by Image
% File.  

agg_num = 1;
container = zeros(2,rows);
img_current = imgids(1,1);  % Pre-loop conditions
diams_by_img = {};

% Loop over the rawimgs based on primary particle
for i = 1:1:rows
    % Check if the current primary particle belongs to a 
    % new aggregate or not, adds it into a temporary container if it is.  
    % If not, slips primary particle data in the container into the 
    % diams_by_img array and move onto the next aggregate
    if isequal(imgids(i,1),img_current)
        current_diam = rawimgs(i,1);
        current_aggid = aggids(i,1);
        container(1,i) = current_diam{1};
        container(2,i) = current_aggid{1};
    else
        disp(['Image #',num2str(agg_num),' complete.']);
        container = manmethods.trimarray(container);
        diams_by_img = [diams_by_img, container];
        container = zeros(2,rows);
        agg_num = agg_num + 1;
        img_current = imgids(i,1);
        disp(['Parsing Image #',num2str(agg_num)]);
    end
end

disp(['Image #',num2str(agg_num),' complete.']);

% Case where there was only one image file in the rawimgs set
if agg_num == 1
    diams_by_img = [diams_by_img, container];
    disp(['Image #',num2str(agg_num),' complete.']);
end

end

