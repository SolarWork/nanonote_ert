function nanonote_callback_handler(hDlg, hSrc)

% Setup the hardware configuration
slConfigUISetVal(hDlg, hSrc, 'ProdHWDeviceType', 'Generic->32-bit Embedded Processor');
        
% Set the target language to C and disable modification
slConfigUISetVal(hDlg, hSrc, 'TargetLang', 'C');
slConfigUISetEnabled(hDlg, hSrc, 'TargetLang', 0);

% Use our own ert_main.c
slConfigUISetVal(hDlg, hSrc, 'ERTCustomFileTemplate', 'nanonote_main.tlc');
slConfigUISetVal(hDlg, hSrc, 'GenerateSampleERTMain', 'off');
slConfigUISetEnabled(hDlg, hSrc, 'GenerateSampleERTMain',0);

% Nanonote is Little Endian
slConfigUISetVal(hDlg, hSrc, 'ProdEndianess', 'LittleEndian');

% The target is model reference compliant
slConfigUISetVal(hDlg, hSrc, 'ModelReferenceCompliant', 'on');
slConfigUISetEnabled(hDlg, hSrc, 'ModelReferenceCompliant', false);

% Set the solver type to fixed step
slConfigUISetVal(hDlg, hSrc, 'SolverType', 'Fixed-Step');
slConfigUISetVal(hDlg, hSrc, 'Solver', 'FixedStepDiscrete');

% Generate report
slConfigUISetVal(hDlg, hSrc, 'GenerateReport', 'on');
slConfigUISetVal(hDlg, hSrc, 'LaunchReport', 'off');
slConfigUISetVal(hDlg, hSrc, 'GenerateCodeMetricsReport', 'on');

% External mode settings
slConfigUISetVal(hDlg, hSrc, 'ExtModeMexArgs',...
	['''',getpref('nanonote','HOSTNAME'),'''',' ',num2str(0)]);
slConfigUISetVal(hDlg, hSrc, 'ExtModeStaticAlloc','on');

% Portable word sizes for switching between PIL/SIL
slConfigUISetVal(hDlg, hSrc, 'PortableWordSizes','on');