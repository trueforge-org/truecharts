package main

import (
    "os"

    "github.com/rs/zerolog/log"
    "github.com/trueforge-org/truecharts/clustertool/pkg/sops"
)

func main() {
    if err := sops.CheckFilesAndReportEncryption(true, true); err != nil {
        log.Info().Msgf("Error checking files: %v\n", err)
        os.Exit(1)
    }
}
