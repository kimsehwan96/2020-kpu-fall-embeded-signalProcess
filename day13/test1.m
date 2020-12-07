clear
clc

% 오디오 신호를 읽어들임
[audio_sig , audio_fs] = audioread('Audio_Pop01_15sec.wav');
L = length(audio_sig); %신호의 길이
t = linspace(0,15,L);

%크기 스펙트럼 분석
[audio_f0,audio_F] = myfun_SA(t,audio_sig);

figure(1)
subplot(2,1,1)
plot(t,audio_sig,'k');
ylim([-0.1,0.1])
xlabel('Time [sec]');
ylabel("Input audio, x(t)");
grid on;

subplot(2,1,2)
plot(audio_f0,abs(audio_F),'k')
xlim([0,5000])
ylim([0,0.015])
xlabel("Frequency [Hz]");
ylabel("|X(f)|");
grid on;

%오디오 재생
sound(audio_sig,audio_fs)