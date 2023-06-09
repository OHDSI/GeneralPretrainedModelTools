# Copyright 2023 Observational Health Data Sciences and Informatics
#
# This file is part of GeneralPretrainedModelTools
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Manually delete package from library. Avoids "Already in use" message when rebuilding
unloadNamespace("GeneralPretrainedModelTools")
.rs.restartR()
folder <- system.file(package = "GeneralPretrainedModelTools")
folder
unlink(folder, recursive = TRUE, force = TRUE)
file.exists(folder)

# Format and check code:
styler::style_pkg()
OhdsiRTools::checkUsagePackage("GeneralPretrainedModelTools")
OhdsiRTools::updateCopyrightYearFolder()
devtools::spell_check()

# Create manual:
unlink("extras/GeneralPretrainedModelTools.pdf")
shell("R CMD Rd2pdf ./ --output=extras/GeneralPretrainedModelTools.pdf")
