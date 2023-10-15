#!/bin/bash
set -e -u -o pipefail

# To run doctests locally, the easiest approach is to do:
# > pytest --doctest-modules speechbrain/
# However, we take this more complex approach to avoid testing files not
# tracked by git. We filter out tests that require optional dependencies.
avoid="transducer_loss.py\|fairseq_wav2vec.py\|bleu.py\|ctc_segmentation.py\|check_url.py\|language_model.py\|k2_integration\|huggingface_transformers"
git ls-files speechbrain | grep -e "\.py$" | grep -v $avoid | xargs pytest --doctest-modules
