.class public Lorg/ifaa/android/manager/IFAAManagerFactory;
.super Ljava/lang/Object;
.source "IFAAManagerFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getIFAAManager(Landroid/content/Context;I)Lorg/ifaa/android/manager/IFAAManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "authType"    # I

    .prologue
    invoke-static {}, Lorg/ifaa/android/manager/IFAAManagerImpl;->getInstance()Lorg/ifaa/android/manager/IFAAManagerV2;

    move-result-object v0

    return-object v0
.end method
