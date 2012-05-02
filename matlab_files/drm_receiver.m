%%%%%%%%%%%%%%%%%%
%% DRM Receiver %%
%%%%%%%%%%%%%%%%%%

% perfect synchronisation and no channel influences are assumed

% clear has to be disabled for unit_tests.m
%clear all
%clc

%% Declare global variables, create input stream
run drm_global_variables
run drm_transmitter

%% OFDM Demod
super_tframe_rx = drm_iofdm(complex_baseband, OFDM);

%% Cell Demapping
[msc_stream_map_interl sdc_stream_map, fac_stream_map] = drm_cell_demapping(super_tframe, MSC, SDC, FAC, OFDM);

%% MSC cell deinterleaving
[msc_stream_mapped] = drm_mlc_deinterleaver(msc_stream_map_interl, 'MSC_cells', MSC);

%% Symbol demapping
%msc_stream_interl = drm_demapping(msc_stream_mapped, 'MSC', MSC);
fac_stream_interl = drm_demapping(fac_stream_mapped, 'FAC', FAC);

%% Bit deinterleaving

%% Decoding

%% Departitioning

%% Unscrambling

%% Output