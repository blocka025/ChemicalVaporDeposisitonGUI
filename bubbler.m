obj1 = instrfind('Type', 'serial', 'Port', 'COM8', 'Tag', '');

if isempty(obj1)
    obj1 = serial('COM8');
else
    fclose(obj1);
    obj1 = obj1(1);
end

fopen(obj1);
set(obj1, 'Timeout', 1.0);
Str = '8A8A52000053';
D   = sscanf(Str, '%2x');
fwrite(obj1, D, 'uint8')