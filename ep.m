%% file 3 of 3: ep.m

% Author: Angus Galloway, March 2015

% Assumes: pmat.py and loadtxt.m have been run
% Notes: 'channels' is an m = 239766 by n = 16 matrix
% provided by loadtxt.m which has been put in another
% script to facilitate debugging

Max = max(channels); %get the extreme values in entire dataset
Min = min(channels);

%suppress broadcast warning
warning ("off", "Octave:broadcast");

for i = 1:16
  % normalize channels one at a time (one column at a time)
  normChannels(:,i) = normalize_var(Max, Min, channels(:,i), 0, 1);
end

% to view a channel
% plot(channels(:,1)); %this is the first channel

% compute 16 choose 2 = 120 features on input data by maximal cross correlation

%compute on 5second frame, which = 2000 samples at 400Hz
%compute 120 of these for each pair on 5s intervals
%a lag (tau) of 0.5s is 200 samples, so we provide 
nChannels = 16;
sampleRate = 400;
lagBySamples = sampleRate * 0.5; %lag by +/- 0.5s = 200
frameSize = 2000;
featureSize = 108000; % 4.5 minute aggregate feature

c = combnk(1:nChannels,2);

for x=1:rows(c) %iterate for M channels choose 2

    f=1; %an index for the correlation vector
    %featureVector = zeros(54,1);

    %compute all the frames at once between a pair of channels
    for n=1:frameSize:featureSize; % 54 frames in 4.5min feature, increment by 2000
	
	iChannel = channels(n:n+2400, c(x,1) ); %get 2400 samples from channel i
	jChannel = channels(n:n+2400, c(x,2) ); %get 2400 samples from channel j
	[correlation, lag] = xcorr(iChannel, jChannel, maxlag=lagBySamples, scale='coeff');   
	featureVector(f) = max(correlation);
	f = f + 1;
    end
    
    movieMatrix(x,:) = featureVector; %movie will have M choose 2 = 120 rows, length 54 features   
    
end

% now have movieMatrix which contains 120 features with 54 terms representing 4.5 mins of data.

%% PLOTTING SECTION %%

%figure(1);
%plot(lag,correlation);
%title('normalized correlation')
%xlabel('lag');
%ylabel('correlation')
%[maxCorrelation, ix] = max(correlation)
%lag(ix);

%[correlation, lag] = xcorr(iChannel, jChannel, maxlag=lagBySamples, scale='coeff');
%plot(lag,correlation);
%hold on;


%crossMax = xcorrelate_var(chann_i, chann_j, lag)


