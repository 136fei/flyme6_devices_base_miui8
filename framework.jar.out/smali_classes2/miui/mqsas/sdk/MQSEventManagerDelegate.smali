.class public Lmiui/mqsas/sdk/MQSEventManagerDelegate;
.super Ljava/lang/Object;
.source "MQSEventManagerDelegate.java"


# static fields
.field private static DEBUG:Z = false

.field private static final MQS_SERVICE_NAME:Ljava/lang/String; = "miui.mqsas.MQSService"

.field private static final TAG:Ljava/lang/String;

.field private static sInstance:Lmiui/mqsas/sdk/MQSEventManagerDelegate;


# instance fields
.field mDeathHandler:Landroid/os/IBinder$DeathRecipient;

.field private mService:Lmiui/mqsas/IMQSService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-class v0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    sput-boolean v0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->DEBUG:Z

    const/4 v0, 0x0

    sput-object v0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->sInstance:Lmiui/mqsas/sdk/MQSEventManagerDelegate;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lmiui/mqsas/sdk/MQSEventManagerDelegate$1;

    invoke-direct {v0, p0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate$1;-><init>(Lmiui/mqsas/sdk/MQSEventManagerDelegate;)V

    iput-object v0, p0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->mDeathHandler:Landroid/os/IBinder$DeathRecipient;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    sget-object v0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lmiui/mqsas/sdk/MQSEventManagerDelegate;Lmiui/mqsas/IMQSService;)Lmiui/mqsas/IMQSService;
    .locals 0
    .param p0, "x0"    # Lmiui/mqsas/sdk/MQSEventManagerDelegate;
    .param p1, "x1"    # Lmiui/mqsas/IMQSService;

    .prologue
    iput-object p1, p0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->mService:Lmiui/mqsas/IMQSService;

    return-object p1
.end method

.method public static declared-synchronized getInstance()Lmiui/mqsas/sdk/MQSEventManagerDelegate;
    .locals 2

    .prologue
    const-class v1, Lmiui/mqsas/sdk/MQSEventManagerDelegate;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->sInstance:Lmiui/mqsas/sdk/MQSEventManagerDelegate;

    if-nez v0, :cond_0

    new-instance v0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;

    invoke-direct {v0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;-><init>()V

    sput-object v0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->sInstance:Lmiui/mqsas/sdk/MQSEventManagerDelegate;

    :cond_0
    sget-object v0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->sInstance:Lmiui/mqsas/sdk/MQSEventManagerDelegate;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method protected declared-synchronized getMQSService()Lmiui/mqsas/IMQSService;
    .locals 4

    .prologue
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->mService:Lmiui/mqsas/IMQSService;

    if-nez v1, :cond_0

    const-string v1, "miui.mqsas.MQSService"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lmiui/mqsas/IMQSService$Stub;->asInterface(Landroid/os/IBinder;)Lmiui/mqsas/IMQSService;

    move-result-object v1

    iput-object v1, p0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->mService:Lmiui/mqsas/IMQSService;

    iget-object v1, p0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->mService:Lmiui/mqsas/IMQSService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    :try_start_1
    iget-object v1, p0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->mService:Lmiui/mqsas/IMQSService;

    invoke-interface {v1}, Lmiui/mqsas/IMQSService;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    iget-object v2, p0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->mDeathHandler:Landroid/os/IBinder$DeathRecipient;

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :goto_0
    :try_start_2
    iget-object v1, p0, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->mService:Lmiui/mqsas/IMQSService;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    :cond_1
    :try_start_4
    sget-object v1, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    const-string v2, "failed to get MQSService."

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method

.method public onBootCompleted()V
    .locals 5

    .prologue
    sget-boolean v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->DEBUG:Z

    if-eqz v2, :cond_0

    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    const-string v3, "onBootCompleted"

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->getMQSService()Lmiui/mqsas/IMQSService;

    move-result-object v1

    .local v1, "service":Lmiui/mqsas/IMQSService;
    if-eqz v1, :cond_1

    invoke-interface {v1}, Lmiui/mqsas/IMQSService;->onBootCompleted()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "service":Lmiui/mqsas/IMQSService;
    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onBootCompleted error happened:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public reportAnrEvent(Lmiui/mqsas/sdk/event/AnrEvent;)V
    .locals 5
    .param p1, "event"    # Lmiui/mqsas/sdk/event/AnrEvent;

    .prologue
    sget-boolean v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->DEBUG:Z

    if-eqz v2, :cond_0

    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportAnrEvent:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lmiui/mqsas/sdk/event/AnrEvent;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->getMQSService()Lmiui/mqsas/IMQSService;

    move-result-object v1

    .local v1, "service":Lmiui/mqsas/IMQSService;
    if-eqz v1, :cond_1

    invoke-interface {v1, p1}, Lmiui/mqsas/IMQSService;->reportAnrEvent(Lmiui/mqsas/sdk/event/AnrEvent;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "service":Lmiui/mqsas/IMQSService;
    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportAnrEvent error happened:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public reportBroadcastEvent(Landroid/content/pm/ParceledListSlice;)V
    .locals 5
    .param p1, "reportEvents"    # Landroid/content/pm/ParceledListSlice;

    .prologue
    sget-boolean v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->DEBUG:Z

    if-eqz v2, :cond_0

    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportBroadcastEvent:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/pm/ParceledListSlice;->getList()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->getMQSService()Lmiui/mqsas/IMQSService;

    move-result-object v1

    .local v1, "service":Lmiui/mqsas/IMQSService;
    if-eqz v1, :cond_1

    invoke-interface {v1, p1}, Lmiui/mqsas/IMQSService;->reportBroadcastEvent(Landroid/content/pm/ParceledListSlice;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "service":Lmiui/mqsas/IMQSService;
    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportBroadcastEvent error happened:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public reportJavaExceptionEvent(Lmiui/mqsas/sdk/event/JavaExceptionEvent;)V
    .locals 5
    .param p1, "event"    # Lmiui/mqsas/sdk/event/JavaExceptionEvent;

    .prologue
    sget-boolean v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->DEBUG:Z

    if-eqz v2, :cond_0

    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportJEEvent:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lmiui/mqsas/sdk/event/JavaExceptionEvent;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->getMQSService()Lmiui/mqsas/IMQSService;

    move-result-object v1

    .local v1, "service":Lmiui/mqsas/IMQSService;
    if-eqz v1, :cond_1

    invoke-interface {v1, p1}, Lmiui/mqsas/IMQSService;->reportJavaExceptionEvent(Lmiui/mqsas/sdk/event/JavaExceptionEvent;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "service":Lmiui/mqsas/IMQSService;
    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportJEEvent error happened:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public reportPackageEvent(Lmiui/mqsas/sdk/event/PackageEvent;)V
    .locals 5
    .param p1, "event"    # Lmiui/mqsas/sdk/event/PackageEvent;

    .prologue
    sget-boolean v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->DEBUG:Z

    if-eqz v2, :cond_0

    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportPackageEvent:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lmiui/mqsas/sdk/event/PackageEvent;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->getMQSService()Lmiui/mqsas/IMQSService;

    move-result-object v1

    .local v1, "service":Lmiui/mqsas/IMQSService;
    if-eqz v1, :cond_1

    invoke-interface {v1, p1}, Lmiui/mqsas/IMQSService;->reportPackageEvent(Lmiui/mqsas/sdk/event/PackageEvent;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "service":Lmiui/mqsas/IMQSService;
    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportPackageEvent error happened:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public reportSimpleEvent(ILjava/lang/String;)V
    .locals 5
    .param p1, "type"    # I
    .param p2, "info"    # Ljava/lang/String;

    .prologue
    sget-boolean v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->DEBUG:Z

    if-eqz v2, :cond_0

    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportSimpleEvent:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->getMQSService()Lmiui/mqsas/IMQSService;

    move-result-object v1

    .local v1, "service":Lmiui/mqsas/IMQSService;
    if-eqz v1, :cond_1

    invoke-interface {v1, p1, p2}, Lmiui/mqsas/IMQSService;->reportSimpleEvent(ILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "service":Lmiui/mqsas/IMQSService;
    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportSimpleEvent error happened:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public reportWatchdogEvent(Lmiui/mqsas/sdk/event/WatchdogEvent;)V
    .locals 5
    .param p1, "event"    # Lmiui/mqsas/sdk/event/WatchdogEvent;

    .prologue
    sget-boolean v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->DEBUG:Z

    if-eqz v2, :cond_0

    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportJWDTEvent:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lmiui/mqsas/sdk/event/WatchdogEvent;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->getMQSService()Lmiui/mqsas/IMQSService;

    move-result-object v1

    .local v1, "service":Lmiui/mqsas/IMQSService;
    if-eqz v1, :cond_1

    invoke-interface {v1, p1}, Lmiui/mqsas/IMQSService;->reportWatchdogEvent(Lmiui/mqsas/sdk/event/WatchdogEvent;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "service":Lmiui/mqsas/IMQSService;
    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Landroid/os/RemoteException;
    sget-object v2, Lmiui/mqsas/sdk/MQSEventManagerDelegate;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reportJWDTEvent error happened:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
