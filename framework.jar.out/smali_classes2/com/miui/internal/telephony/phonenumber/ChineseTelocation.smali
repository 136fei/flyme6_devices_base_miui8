.class public Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;
.super Ljava/lang/Object;
.source "ChineseTelocation.java"


# static fields
.field private static final EMPTY:Ljava/lang/String; = ""

.field private static final TAG:Ljava/lang/String; = "ChineseTelocation"

.field private static sInstance:Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;


# instance fields
.field private mAllowTelocation:Z

.field private mContext:Landroid/content/Context;

.field private mSettingObserver:Landroid/database/ContentObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    new-instance v0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;

    invoke-direct {v0}, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;-><init>()V

    sput-object v0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->sInstance:Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;)V
    .locals 0
    .param p0, "x0"    # Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;

    .prologue
    invoke-direct {p0}, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->updateTelocationSetting()V

    return-void
.end method

.method public static getCurrentCountryIso(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .local v1, "countryIso":Ljava/lang/String;
    const-string v4, "country_detector"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/CountryDetector;

    .local v2, "detector":Landroid/location/CountryDetector;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/location/CountryDetector;->detectCountry()Landroid/location/Country;

    move-result-object v0

    .local v0, "country":Landroid/location/Country;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/location/Country;->getCountryIso()Ljava/lang/String;

    move-result-object v1

    .end local v0    # "country":Landroid/location/Country;
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget-object v3, v4, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .local v3, "locale":Ljava/util/Locale;
    invoke-virtual {v3}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    .end local v3    # "locale":Ljava/util/Locale;
    :cond_1
    return-object v1

    .restart local v0    # "country":Landroid/location/Country;
    :cond_2
    const-string v4, "ChineseTelocation"

    const-string v5, "getCurrentCountryIso CountryDetector.detectCountry() is null."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getInstance()Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;
    .locals 1

    .prologue
    sget-object v0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->sInstance:Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;

    return-object v0
.end method

.method private initObserver(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mContext:Landroid/content/Context;

    if-nez v1, :cond_0

    iput-object p1, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mContext:Landroid/content/Context;

    :cond_0
    invoke-direct {p0}, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->updateTelocationSetting()V

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation$1;

    invoke-direct {v1, p0, v0}, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation$1;-><init>(Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mSettingObserver:Landroid/database/ContentObserver;

    iget-object v1, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "enable_telocation"

    invoke-static {v2}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mSettingObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void
.end method

.method private updateTelocationSetting()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0}, Landroid/provider/MiuiSettings$Telephony;->isTelocationEnable(Landroid/content/ContentResolver;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mAllowTelocation:Z

    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    iget-object v0, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mSettingObserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mSettingObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public getAreaCode(Ljava/lang/CharSequence;II)Ljava/lang/String;
    .locals 1
    .param p1, "cs"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "length"    # I

    .prologue
    invoke-static {}, Lmiui/telephony/phonenumber/ChineseTelocationConverter;->getInstance()Lmiui/telephony/phonenumber/ChineseTelocationConverter;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lmiui/telephony/phonenumber/ChineseTelocationConverter;->getAreaCode(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExternalLocation(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Ljava/util/Locale;)Ljava/lang/String;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "countryCode"    # Ljava/lang/String;
    .param p3, "number"    # Ljava/lang/CharSequence;
    .param p4, "locale"    # Ljava/util/Locale;

    .prologue
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lmiui/telephony/phonenumber/CountryCode;->getUserDefinedCountryCode()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lmiui/telephony/phonenumber/CountryCode;->getIccCountryCode()Ljava/lang/String;

    move-result-object p2

    :cond_0
    :try_start_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/i18n/phonenumbers/geocoding/PhoneNumberOfflineGeocoder;->getInstance()Lcom/android/i18n/phonenumbers/geocoding/PhoneNumberOfflineGeocoder;

    move-result-object v0

    invoke-static {}, Lcom/android/i18n/phonenumbers/PhoneNumberUtil;->getInstance()Lcom/android/i18n/phonenumbers/PhoneNumberUtil;

    move-result-object v1

    invoke-interface {p3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->getCurrentCountryIso(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/android/i18n/phonenumbers/PhoneNumberUtil;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/android/i18n/phonenumbers/Phonenumber$PhoneNumber;

    move-result-object v1

    invoke-virtual {v0, v1, p4}, Lcom/android/i18n/phonenumbers/geocoding/PhoneNumberOfflineGeocoder;->getDescriptionForNumber(Lcom/android/i18n/phonenumbers/Phonenumber$PhoneNumber;Ljava/util/Locale;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method public getLocation(Landroid/content/Context;Ljava/lang/CharSequence;IIZ)Ljava/lang/String;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cs"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "length"    # I
    .param p5, "withAreaCode"    # Z

    .prologue
    iget-object v2, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mContext:Landroid/content/Context;

    if-nez v2, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->initObserver(Landroid/content/Context;)V

    :cond_0
    iget-boolean v2, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mAllowTelocation:Z

    if-nez v2, :cond_2

    const-string v1, ""

    :cond_1
    :goto_0
    return-object v1

    :cond_2
    const-string v1, ""

    .local v1, "location":Ljava/lang/String;
    const/4 v0, -0x1

    .local v0, "id":I
    if-eqz p5, :cond_3

    invoke-static {}, Lmiui/telephony/phonenumber/ChineseTelocationConverter;->getInstance()Lmiui/telephony/phonenumber/ChineseTelocationConverter;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, p2, p3, p4, v3}, Lmiui/telephony/phonenumber/ChineseTelocationConverter;->getUniqId(Ljava/lang/CharSequence;IIZ)I

    move-result v0

    :cond_3
    if-lez v0, :cond_1

    invoke-static {}, Lmiui/telephony/phonenumber/ChineseTelocationConverter;->getInstance()Lmiui/telephony/phonenumber/ChineseTelocationConverter;

    move-result-object v2

    invoke-virtual {v2, p2, p3, p4, p5}, Lmiui/telephony/phonenumber/ChineseTelocationConverter;->getLocation(Ljava/lang/CharSequence;IIZ)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getOperator(Landroid/content/Context;Ljava/lang/CharSequence;IIZ)Ljava/lang/String;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cs"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "length"    # I
    .param p5, "isNormalMobileNumber"    # Z

    .prologue
    iget-object v1, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mContext:Landroid/content/Context;

    if-nez v1, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->initObserver(Landroid/content/Context;)V

    :cond_0
    iget-boolean v1, p0, Lcom/miui/internal/telephony/phonenumber/ChineseTelocation;->mAllowTelocation:Z

    if-nez v1, :cond_1

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_1
    if-nez p5, :cond_2

    const-string v0, ""

    goto :goto_0

    :cond_2
    invoke-static {}, Lmiui/telephony/phonenumber/ChineseTelocationConverter;->getInstance()Lmiui/telephony/phonenumber/ChineseTelocationConverter;

    move-result-object v1

    invoke-virtual {v1, p2, p3, p4}, Lmiui/telephony/phonenumber/ChineseTelocationConverter;->getOperator(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v0

    .local v0, "operator":Ljava/lang/String;
    goto :goto_0
.end method

.method public parseAreaCode(Ljava/lang/CharSequence;II)Ljava/lang/String;
    .locals 1
    .param p1, "cs"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "length"    # I

    .prologue
    invoke-static {}, Lmiui/telephony/phonenumber/ChineseTelocationConverter;->getInstance()Lmiui/telephony/phonenumber/ChineseTelocationConverter;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lmiui/telephony/phonenumber/ChineseTelocationConverter;->parseAreaCode(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
