vidi = VideoReader("Dr_1e-01_q0_1e-07_scaled.mp4");
aft = VideoWriter("Dr_1e-01_q0_1e-07_scaled_after.mp4",'MPEG-4');
firstF = read(vidi,1);
imshow(firstF);
open(aft);
[~, c] = imcrop(firstF);

for i = 1: round(vidi.NumFrames)
    if mod(i,3)==0
        frame = imcrop(read(vidi,i),c);
        writeVideo(aft, frame);
    end
end
close(aft);