.class public Lmiui/content/pm/PreloadedAppPolicy;
.super Ljava/lang/Object;
.source "PreloadedAppPolicy.java"


# static fields
.field private static sAllowDisableSystemApps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sProtectedDataApps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sAllowDisableSystemApps:Ljava/util/ArrayList;

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.xiaomi.pass"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.xiaomi.scanner"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.xiaomi.midrop"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.xiaomi.gamecenter"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.miui.weather2"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.miui.notes"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.miui.compass"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.miui.calculator"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.mi.misupport"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.android.email"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    const-string v1, "com.android.soundrecorder"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sAllowDisableSystemApps:Ljava/util/ArrayList;

    const-string v1, "com.miui.cleanmaster"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sAllowDisableSystemApps:Ljava/util/ArrayList;

    const-string v1, "com.miui.personalassistant"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sAllowDisableSystemApps:Ljava/util/ArrayList;

    const-string v1, "com.miui.voip"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sAllowDisableSystemApps:Ljava/util/ArrayList;

    const-string v1, "com.miui.yellowpage"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isAllowDisableSystemApp(Landroid/content/Context;Ljava/lang/String;I)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "flags"    # I

    .prologue
    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sAllowDisableSystemApps:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isProtectedDataApp(Landroid/content/Context;Ljava/lang/String;I)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "flags"    # I

    .prologue
    sget-object v0, Lmiui/content/pm/PreloadedAppPolicy;->sProtectedDataApps:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
