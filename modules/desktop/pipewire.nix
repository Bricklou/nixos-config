{pkgs, ...}: {
  services.pipewire = {
    extraLv2Packages = [pkgs.rnnoise-plugin];

    #   extraConfig.pipewire = {
    #     "99-input-denoising.conf" = {
    #       context.modules = [
    #         {
    #           name = "libpipewire-module-filter-chain";
    #           args = {
    #             node.name = "rnnoise_source";
    #             node.description = "Noise Canceling source";
    #             media.name = "Noise Canceling source";
    #             filter.graph = {
    #               nodes = [
    #                 {
    #                   type = "ladspa";
    #                   name = "rnnoise";
    #                   plugin = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
    #                   label = "noise_suppressor_mono";
    #                   control = {
    #                     "VAD Threshold (%)" = 50.0;
    #                     "VAD Grace Period (ms)" = 200;
    #                     "Retroactive VAD Grace (ms)" = 0;
    #                   };
    #                 }
    #               ];
    #             };
    #             "capture.props" = {
    #               "node.passive" = true;
    #             };
    #             "playback.props" = {
    #               "media.class" = "Audio/Source";
    #             };
    #           };
    #         }
    #       ];
    #     };
    #   };
  };

  environment.systemPackages = with pkgs; [
    rnnoise-plugin
    easyeffects
  ];
}
