/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_variant.h>
#include <libinit_utils.h>
#include <unistd.h>

#include "vendor_init.h"

static const variant_info_t a055f_info = {
    .hwc_value = "",
    .sku_value = "a05m",

    .brand = "Samsung",
    .device = "a05m",
    .marketname = "Samsung Galaxy A05",
    .model = "SM-A055M",
    .build_fingerprint = "samsung/a05mxx/a05m:12/SP1A.210812.016/A055FXXU4CXF1:user/release-keys"
};

static const variant_info_t a055m_info = {
    .hwc_value = "",
    .sku_value = "a05m",

    .brand = "Samsung",
    .device = "a05m",
    .marketname = "Samsung Galaxy A05",
    .model = "SM-A055F",
    .build_fingerprint = "samsung/a05mxx/a05m:12/SP1A.210812.016/A055FXXU4CXF1:user/release-keys"
};


static const std::vector<variant_info_t> variants = {
    a055f_info,
    a055m_info,
};

void vendor_load_properties() {
    if (access("/system/bin/recovery", F_OK) != 0) {
        search_variant(variants);
    }
}
