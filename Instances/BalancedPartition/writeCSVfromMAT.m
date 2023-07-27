function writeCSVfromMAT(folderID)
allFiles = dir(folderID);
nbFiles = length(allFiles);
csvData = [];
for idx = 3 : nbFiles
    thisFile = allFiles(idx);
    testVar = load([thisFile.folder '\' thisFile.name]);
    if isfield(testVar,'instance')
        csvData = [csvData; testVar.instance.instanceItems];
    else
        error('Invalid field. Aborting!')
    end
end
csvwrite('instanceDataset.csv', csvData)
fprintf('Folder %s processed successfuly!\n', folderID)
end