.class public Landroid/os/AnrMonitor;
.super Ljava/lang/Object;
.source "AnrMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/os/AnrMonitor$FileInfo;,
        Landroid/os/AnrMonitor$TimerThread;,
        Landroid/os/AnrMonitor$UploadInfo;,
        Landroid/os/AnrMonitor$WorkHandler;
    }
.end annotation


# static fields
.field public static final ANR_DIRECTORY:Ljava/lang/String; = "/data/anr/"

.field public static final ANR_INFO_HEAD:Ljava/lang/String; = "anr_info_"

.field public static final ANR_INFO_LIMIT:I = 0x5

.field public static final ANR_TRACES_LIMIT:I = 0x5

.field public static final BINDER_CALL_MONITOR_TIMEOUT:J = 0xbb8L

.field private static final DATE:Ljava/util/Date;

.field private static final DATE_FORMATTER:Ljava/text/SimpleDateFormat;

.field public static final DBG:Z

.field public static final DEFAULT_MESSAGE_HISTORY_DUMP_DURATION:I = 0x2710

.field public static final DUMP_APP_TRACE_TAG:Ljava/lang/String; = "dump-app-trace"

.field public static final DUMP_MESSAGE_TIMEOUT:J = 0xc8L

.field private static final DUMP_TRACE_TAG:Ljava/lang/String; = "DUMP_APP_TRACE"

.field public static final INPUT_MONITOR_TIMEOUT:J = 0x3e8L

.field private static final LINE_SEPARATOR:Ljava/lang/String;

.field public static final LT_MESSAGE_CHECK_TIME:J = 0xc8L

.field public static final MAX_MESSAGE_SUMMARY_HISTORY:I = 0x32

.field public static final MAX_TIMEOUT:J = 0x186a0L

.field public static final MESSAGE_EXECUTION_TIMEOUT:J = 0x7d0L

.field public static final MESSAGE_MONITOR_TIMEOUT:J

.field private static final MESSAGE_UPLOAD_CHECK_TIME:J = 0xbb8L

.field private static final MONITOR_MSG_EXECUTION:Z

.field private static final MONITOR_TAG:Ljava/lang/String; = "MIUI-BLOCK-MONITOR"

.field public static final SEPARATOR:Ljava/lang/String; = ","

.field private static final TAG:Ljava/lang/String; = "AnrMonitor"

.field public static final TRACES_FILE_TYPE:Ljava/lang/String; = ".txt"

.field public static final TRACES_HEAD:Ljava/lang/String; = "traces_"

.field private static final TRACE_DIR:Ljava/lang/String; = "/data/anr/"

.field private static final mInputEvnetStartTimeSeqMap:Landroid/util/SparseLongArray;

.field private static sInputRecordIndex:I

.field private static final sInstanceSync:Ljava/lang/Object;

.field private static sIsSystemApp:Ljava/lang/Boolean;

.field private static final sMonitorList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sMsgRecordIndex:I

.field private static sPkgName:Ljava/lang/String;

.field private static sProcessName:Ljava/lang/String;

.field private static sSystemBootCompleted:Z

.field private static final sUploadInputRecords:[Landroid/os/AnrMonitor$UploadInfo;

.field private static final sUploadMsgRecords:[Landroid/os/AnrMonitor$UploadInfo;

.field private static sVersionCode:I

.field private static sVersionName:Ljava/lang/String;

.field private static sWorkHandler:Landroid/os/AnrMonitor$WorkHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/16 v3, 0xa

    const/4 v2, 0x0

    const-string v0, "anr.monitor.debug.on"

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Landroid/os/AnrMonitor;->DBG:Z

    const-string v0, "monitor.msg.execution"

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Landroid/os/AnrMonitor;->MONITOR_MSG_EXECUTION:Z

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    sput-object v0, Landroid/os/AnrMonitor;->DATE:Ljava/util/Date;

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd_HH_mm_ss.SSS"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroid/os/AnrMonitor;->DATE_FORMATTER:Ljava/text/SimpleDateFormat;

    const-string v0, "line.separator"

    const-string v1, "\n"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/os/AnrMonitor;->LINE_SEPARATOR:Ljava/lang/String;

    sget-boolean v0, Lmiui/os/Build;->IS_ALPHA_BUILD:Z

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x7d0

    :goto_0
    sput-wide v0, Landroid/os/AnrMonitor;->MESSAGE_MONITOR_TIMEOUT:J

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/os/AnrMonitor;->sInstanceSync:Ljava/lang/Object;

    sput v2, Landroid/os/AnrMonitor;->sMsgRecordIndex:I

    new-array v0, v3, [Landroid/os/AnrMonitor$UploadInfo;

    sput-object v0, Landroid/os/AnrMonitor;->sUploadMsgRecords:[Landroid/os/AnrMonitor$UploadInfo;

    sput v2, Landroid/os/AnrMonitor;->sInputRecordIndex:I

    new-array v0, v3, [Landroid/os/AnrMonitor$UploadInfo;

    sput-object v0, Landroid/os/AnrMonitor;->sUploadInputRecords:[Landroid/os/AnrMonitor$UploadInfo;

    new-instance v0, Landroid/util/SparseLongArray;

    invoke-direct {v0}, Landroid/util/SparseLongArray;-><init>()V

    sput-object v0, Landroid/os/AnrMonitor;->mInputEvnetStartTimeSeqMap:Landroid/util/SparseLongArray;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Landroid/os/AnrMonitor;->sMonitorList:Ljava/util/ArrayList;

    sget-boolean v0, Lmiui/os/Build;->IS_ALPHA_BUILD:Z

    if-eqz v0, :cond_0

    sget-object v0, Landroid/os/AnrMonitor;->sMonitorList:Ljava/util/ArrayList;

    const-string v1, "com.android.systemui"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Landroid/os/AnrMonitor;->sMonitorList:Ljava/util/ArrayList;

    const-string v1, "com.android.settings"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Landroid/os/AnrMonitor;->sMonitorList:Ljava/util/ArrayList;

    const-string v1, "com.android.phone"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Landroid/os/AnrMonitor;->sMonitorList:Ljava/util/ArrayList;

    const-string v1, "com.miui.home"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void

    :cond_1
    const-wide/16 v0, 0xbb8

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()Z
    .locals 1

    .prologue
    invoke-static {}, Landroid/os/AnrMonitor;->isSystemBootCompleted()Z

    move-result v0

    return v0
.end method

.method private static declared-synchronized addMessageToHistory(Landroid/os/Message;Landroid/os/BaseLooper$MessageMonitorInfo;)V
    .locals 8
    .param p0, "msg"    # Landroid/os/Message;
    .param p1, "monitorInfo"    # Landroid/os/BaseLooper$MessageMonitorInfo;

    .prologue
    const-class v5, Landroid/os/AnrMonitor;

    monitor-enter v5

    :try_start_0
    iget-object v4, p0, Landroid/os/Message;->target:Landroid/os/Handler;

    if-eqz v4, :cond_3

    new-instance v3, Landroid/os/AnrMonitor$UploadInfo;

    invoke-direct {v3}, Landroid/os/AnrMonitor$UploadInfo;-><init>()V

    .local v3, "uploadMsgInfo":Landroid/os/AnrMonitor$UploadInfo;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .local v0, "b":Ljava/lang/StringBuilder;
    const-string v4, "The message {"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroid/os/Message;->callback:Ljava/lang/Runnable;

    if-eqz v4, :cond_4

    const-string v4, " callback="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroid/os/Message;->callback:Ljava/lang/Runnable;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    const-string v4, " target="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroid/os/Message;->target:Landroid/os/Handler;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "}"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Landroid/os/AnrMonitor$UploadInfo;->info:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/BaseLooper$MessageMonitorInfo;->getTookTimeAfterDispatch()J

    move-result-wide v6

    iput-wide v6, v3, Landroid/os/AnrMonitor$UploadInfo;->tookTime:J

    sget-boolean v4, Landroid/os/AnrMonitor;->MONITOR_MSG_EXECUTION:Z

    if-eqz v4, :cond_0

    const-string v4, "AnrMonitor"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "The msg "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Landroid/os/BaseLooper$MessageMonitorInfo;->getMonitorMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " add to history sMsgRecordIndex "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget v7, Landroid/os/AnrMonitor;->sMsgRecordIndex:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    sget-object v4, Landroid/os/AnrMonitor;->sUploadMsgRecords:[Landroid/os/AnrMonitor$UploadInfo;

    sget v6, Landroid/os/AnrMonitor;->sMsgRecordIndex:I

    add-int/lit8 v7, v6, 0x1

    sput v7, Landroid/os/AnrMonitor;->sMsgRecordIndex:I

    aput-object v3, v4, v6

    sget v4, Landroid/os/AnrMonitor;->sMsgRecordIndex:I

    sget-object v6, Landroid/os/AnrMonitor;->sUploadMsgRecords:[Landroid/os/AnrMonitor$UploadInfo;

    array-length v6, v6

    if-lt v4, v6, :cond_3

    sget-object v4, Landroid/os/AnrMonitor;->sUploadMsgRecords:[Landroid/os/AnrMonitor$UploadInfo;

    # invokes: Landroid/os/AnrMonitor$UploadInfo;->createJsonString([Landroid/os/AnrMonitor$UploadInfo;)Ljava/lang/String;
    invoke-static {v4}, Landroid/os/AnrMonitor$UploadInfo;->access$000([Landroid/os/AnrMonitor$UploadInfo;)Ljava/lang/String;

    move-result-object v2

    .local v2, "reportContent":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .local v1, "message":Landroid/os/Message;
    const/4 v4, 0x2

    iput v4, v1, Landroid/os/Message;->what:I

    iput-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    sget-boolean v4, Landroid/os/AnrMonitor;->MONITOR_MSG_EXECUTION:Z

    if-eqz v4, :cond_1

    const-string v4, "AnrMonitor"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "report content : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    invoke-static {}, Landroid/os/AnrMonitor;->getWorkHandler()Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/os/Handler;->sendMessageAtFrontOfQueue(Landroid/os/Message;)Z

    .end local v1    # "message":Landroid/os/Message;
    :cond_2
    const/4 v4, 0x0

    sput v4, Landroid/os/AnrMonitor;->sMsgRecordIndex:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v0    # "b":Ljava/lang/StringBuilder;
    .end local v2    # "reportContent":Ljava/lang/String;
    .end local v3    # "uploadMsgInfo":Landroid/os/AnrMonitor$UploadInfo;
    :cond_3
    monitor-exit v5

    return-void

    .restart local v0    # "b":Ljava/lang/StringBuilder;
    .restart local v3    # "uploadMsgInfo":Landroid/os/AnrMonitor$UploadInfo;
    :cond_4
    :try_start_1
    const-string v4, " what="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Landroid/os/Message;->what:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .end local v0    # "b":Ljava/lang/StringBuilder;
    .end local v3    # "uploadMsgInfo":Landroid/os/AnrMonitor$UploadInfo;
    :catchall_0
    move-exception v4

    monitor-exit v5

    throw v4
.end method

.method public static canMonitorAnr()Z
    .locals 1

    .prologue
    sget-boolean v0, Lmiui/os/Build;->IS_ALPHA_BUILD:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_DEVELOPMENT_VERSION:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static canMonitorMessage()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    sget-boolean v1, Landroid/os/AnrMonitor;->MONITOR_MSG_EXECUTION:Z

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    sget-object v1, Landroid/os/AnrMonitor;->sMonitorList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Landroid/os/AnrMonitor;->sMonitorList:Ljava/util/ArrayList;

    invoke-static {}, Landroid/os/AnrMonitor;->currentPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static checkBinderCallTime(J)V
    .locals 4
    .param p0, "startTime"    # J

    .prologue
    invoke-static {}, Landroid/os/AnrMonitor;->canMonitorAnr()Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sub-long v0, v2, p0

    .local v0, "tookTime":J
    const-wide/16 v2, 0xbb8

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The binder call took "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "ms."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/Throwable;

    invoke-direct {v3}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v2, v3}, Landroid/os/AnrMonitor;->logAnr(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static checkInputTime(JLandroid/view/InputEvent;)V
    .locals 6
    .param p0, "startTime"    # J
    .param p2, "event"    # Landroid/view/InputEvent;

    .prologue
    invoke-static {}, Landroid/os/AnrMonitor;->canMonitorAnr()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    sub-long v2, v4, p0

    .local v2, "tookTime":J
    const-wide/16 v4, 0x3e8

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The input: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " took "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "ms."

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    invoke-static {v1, v4}, Landroid/os/AnrMonitor;->logAnr(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "checkInputTime failed and took time is : "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "ms."

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/os/AnrMonitor;->logAnr(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static checkInputTime(Landroid/view/InputEvent;Landroid/view/InputEventReceiver;Landroid/view/InputChannel;)V
    .locals 12
    .param p0, "event"    # Landroid/view/InputEvent;
    .param p1, "receiver"    # Landroid/view/InputEventReceiver;
    .param p2, "inputChannel"    # Landroid/view/InputChannel;

    .prologue
    invoke-static {}, Landroid/os/AnrMonitor;->canMonitorAnr()Z

    move-result v7

    if-nez v7, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v7, Landroid/os/AnrMonitor;->mInputEvnetStartTimeSeqMap:Landroid/util/SparseLongArray;

    invoke-virtual {p0}, Landroid/view/InputEvent;->getSequenceNumber()I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/util/SparseLongArray;->indexOfKey(I)I

    move-result v1

    .local v1, "index":I
    if-ltz v1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    sget-object v7, Landroid/os/AnrMonitor;->mInputEvnetStartTimeSeqMap:Landroid/util/SparseLongArray;

    invoke-virtual {v7, v1}, Landroid/util/SparseLongArray;->valueAt(I)J

    move-result-wide v10

    sub-long v4, v8, v10

    .local v4, "tookTime":J
    sget-object v7, Landroid/os/AnrMonitor;->mInputEvnetStartTimeSeqMap:Landroid/util/SparseLongArray;

    invoke-virtual {v7, v1}, Landroid/util/SparseLongArray;->removeAt(I)V

    const-wide/16 v8, 0x3e8

    cmp-long v7, v4, v8

    if-lez v7, :cond_0

    new-instance v6, Landroid/os/AnrMonitor$UploadInfo;

    invoke-direct {v6}, Landroid/os/AnrMonitor$UploadInfo;-><init>()V

    .local v6, "uploadInputInfo":Landroid/os/AnrMonitor$UploadInfo;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .local v0, "b":Ljava/lang/StringBuilder;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "The inputEvent "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {p0}, Landroid/os/AnrMonitor;->inputEventToString(Landroid/view/InputEvent;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " {"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " target reveicer = "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " target InputChannel = "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Landroid/os/AnrMonitor;->inputChannelToString(Landroid/view/InputChannel;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "}"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Landroid/os/AnrMonitor$UploadInfo;->info:Ljava/lang/String;

    iput-wide v4, v6, Landroid/os/AnrMonitor$UploadInfo;->tookTime:J

    sget-object v7, Landroid/os/AnrMonitor;->sUploadInputRecords:[Landroid/os/AnrMonitor$UploadInfo;

    sget v8, Landroid/os/AnrMonitor;->sInputRecordIndex:I

    add-int/lit8 v9, v8, 0x1

    sput v9, Landroid/os/AnrMonitor;->sInputRecordIndex:I

    aput-object v6, v7, v8

    sget v7, Landroid/os/AnrMonitor;->sInputRecordIndex:I

    sget-object v8, Landroid/os/AnrMonitor;->sUploadInputRecords:[Landroid/os/AnrMonitor$UploadInfo;

    array-length v8, v8

    if-lt v7, v8, :cond_4

    sget-object v7, Landroid/os/AnrMonitor;->sUploadInputRecords:[Landroid/os/AnrMonitor$UploadInfo;

    # invokes: Landroid/os/AnrMonitor$UploadInfo;->createJsonString([Landroid/os/AnrMonitor$UploadInfo;)Ljava/lang/String;
    invoke-static {v7}, Landroid/os/AnrMonitor$UploadInfo;->access$000([Landroid/os/AnrMonitor$UploadInfo;)Ljava/lang/String;

    move-result-object v3

    .local v3, "reportContent":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    .local v2, "message":Landroid/os/Message;
    const/4 v7, 0x2

    iput v7, v2, Landroid/os/Message;->what:I

    iput-object v3, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    sget-boolean v7, Landroid/os/AnrMonitor;->MONITOR_MSG_EXECUTION:Z

    if-eqz v7, :cond_2

    const-string v7, "AnrMonitor"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "report content : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    invoke-static {}, Landroid/os/AnrMonitor;->getWorkHandler()Landroid/os/Handler;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/os/Handler;->sendMessageAtFrontOfQueue(Landroid/os/Message;)Z

    .end local v2    # "message":Landroid/os/Message;
    :cond_3
    const/4 v7, 0x0

    sput v7, Landroid/os/AnrMonitor;->sInputRecordIndex:I

    .end local v3    # "reportContent":Ljava/lang/String;
    :cond_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "The input: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {p0}, Landroid/os/AnrMonitor;->inputEventToString(Landroid/view/InputEvent;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " took "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "ms. Send to InputChannel "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p2}, Landroid/view/InputChannel;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {v7, v8}, Landroid/os/AnrMonitor;->logAnr(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0
.end method

.method public static checkMsgTime(Landroid/os/Message;Landroid/os/BaseLooper$MessageMonitorInfo;)V
    .locals 6
    .param p0, "msg"    # Landroid/os/Message;
    .param p1, "monitorInfo"    # Landroid/os/BaseLooper$MessageMonitorInfo;

    .prologue
    invoke-static {}, Landroid/os/AnrMonitor;->canMonitorAnr()Z

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/os/BaseLooper$MessageMonitorInfo;->getTookTime()J

    move-result-wide v0

    .local v0, "tookTime":J
    invoke-virtual {p1}, Landroid/os/BaseLooper$MessageMonitorInfo;->getTookTimeAfterDispatch()J

    move-result-wide v2

    .local v2, "tookTimeAfterDispatch":J
    const-wide/32 v4, 0x186a0

    cmp-long v4, v0, v4

    if-gtz v4, :cond_0

    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-ltz v4, :cond_0

    sget-wide v4, Landroid/os/AnrMonitor;->MESSAGE_MONITOR_TIMEOUT:J

    cmp-long v4, v2, v4

    if-lez v4, :cond_2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "The msg "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Landroid/os/BaseLooper$MessageMonitorInfo;->getMonitorMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms and took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms after dispatch."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/os/AnrMonitor;->logAnr(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    const-wide/16 v4, 0xbb8

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    invoke-static {p0, p1}, Landroid/os/AnrMonitor;->addMessageToHistory(Landroid/os/Message;Landroid/os/BaseLooper$MessageMonitorInfo;)V

    goto :goto_0
.end method

.method public static createFile(Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    invoke-static {p0, v0}, Landroid/os/AnrMonitor;->createFile(Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static createFile(Ljava/lang/String;Z)Ljava/io/File;
    .locals 8
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "forceClear"    # Z

    .prologue
    const/4 v3, 0x0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v1, "file":Ljava/io/File;
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .local v2, "tracesDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    invoke-static {v2}, Landroid/os/SELinux;->restorecon(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_0

    move-object v1, v3

    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "tracesDir":Ljava/io/File;
    :goto_0
    return-object v1

    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "tracesDir":Ljava/io/File;
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x1fd

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-static {v4, v5, v6, v7}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    if-eqz p1, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x1b6

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-static {v4, v5, v6, v7}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v2    # "tracesDir":Ljava/io/File;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    const-string v4, "AnrMonitor"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to create file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v1, v3

    goto :goto_0
.end method

.method static declared-synchronized currentPackageName()Ljava/lang/String;
    .locals 3

    .prologue
    const-class v2, Landroid/os/AnrMonitor;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v0

    .local v0, "pkgName":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "system_server"

    sput-object v1, Landroid/os/AnrMonitor;->sPkgName:Ljava/lang/String;

    :goto_0
    sget-object v1, Landroid/os/AnrMonitor;->sPkgName:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    return-object v1

    :cond_0
    :try_start_1
    sput-object v0, Landroid/os/AnrMonitor;->sPkgName:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method static declared-synchronized currentProcessName()Ljava/lang/String;
    .locals 3

    .prologue
    const-class v2, Landroid/os/AnrMonitor;

    monitor-enter v2

    :try_start_0
    sget-object v1, Landroid/os/AnrMonitor;->sProcessName:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Landroid/app/ActivityThread;->currentProcessName()Ljava/lang/String;

    move-result-object v0

    .local v0, "processName":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "system_server"

    sput-object v1, Landroid/os/AnrMonitor;->sProcessName:Ljava/lang/String;

    :cond_0
    :goto_0
    sget-object v1, Landroid/os/AnrMonitor;->sProcessName:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    return-object v1

    :cond_1
    :try_start_1
    sput-object v0, Landroid/os/AnrMonitor;->sProcessName:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method static declared-synchronized currentVersionCode()I
    .locals 6

    .prologue
    const-class v3, Landroid/os/AnrMonitor;

    monitor-enter v3

    :try_start_0
    sget v2, Landroid/os/AnrMonitor;->sVersionCode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    :try_start_1
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .local v1, "info":Landroid/content/pm/PackageInfo;
    if-eqz v1, :cond_0

    iget v2, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    if-eqz v2, :cond_0

    iget v2, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    sput v2, Landroid/os/AnrMonitor;->sVersionCode:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    :cond_0
    :goto_0
    :try_start_2
    sget v2, Landroid/os/AnrMonitor;->sVersionCode:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v3

    return v2

    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method static declared-synchronized currentVersionName()Ljava/lang/String;
    .locals 6

    .prologue
    const-class v3, Landroid/os/AnrMonitor;

    monitor-enter v3

    :try_start_0
    sget-object v2, Landroid/os/AnrMonitor;->sVersionName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_0

    :try_start_1
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .local v1, "info":Landroid/content/pm/PackageInfo;
    if-eqz v1, :cond_0

    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    sput-object v2, Landroid/os/AnrMonitor;->sVersionName:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    :cond_0
    :goto_0
    :try_start_2
    sget-object v2, Landroid/os/AnrMonitor;->sVersionName:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v3

    return-object v2

    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private static deleteUnnecessaryFileIfNeeded(Ljava/io/File;Ljava/lang/String;I)V
    .locals 13
    .param p0, "dir"    # Ljava/io/File;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "limit"    # I

    .prologue
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v12

    if-nez v12, :cond_1

    :cond_0
    return-void

    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .local v3, "fileInfoList":Ljava/util/List;, "Ljava/util/List<Landroid/os/AnrMonitor$FileInfo;>;"
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v11

    .local v11, "subFiles":[Ljava/io/File;
    move-object v0, v11

    .local v0, "arr$":[Ljava/io/File;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_0
    if-ge v6, v7, :cond_3

    aget-object v10, v0, v6

    .local v10, "subFile":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    .local v4, "filename":Ljava/lang/String;
    if-eqz v4, :cond_2

    invoke-virtual {v4, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-virtual {v10}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    .local v8, "modifiedTime":J
    new-instance v12, Landroid/os/AnrMonitor$FileInfo;

    invoke-direct {v12, v10, v8, v9}, Landroid/os/AnrMonitor$FileInfo;-><init>(Ljava/io/File;J)V

    invoke-interface {v3, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .end local v8    # "modifiedTime":J
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .end local v4    # "filename":Ljava/lang/String;
    .end local v10    # "subFile":Ljava/io/File;
    :cond_3
    :try_start_0
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    move v5, p2

    .local v5, "i":I
    :goto_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v12

    if-ge v5, v12, :cond_0

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/os/AnrMonitor$FileInfo;

    invoke-virtual {v12}, Landroid/os/AnrMonitor$FileInfo;->getFile()Ljava/io/File;

    move-result-object v2

    .local v2, "file":Ljava/io/File;
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .end local v2    # "file":Ljava/io/File;
    .end local v5    # "i":I
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_1
.end method

.method public static dispatchInputEventStart(Landroid/view/InputEvent;)V
    .locals 4
    .param p0, "event"    # Landroid/view/InputEvent;

    .prologue
    sget-object v0, Landroid/os/AnrMonitor;->mInputEvnetStartTimeSeqMap:Landroid/util/SparseLongArray;

    invoke-virtual {p0}, Landroid/view/InputEvent;->getSequenceNumber()I

    move-result v1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/util/SparseLongArray;->put(IJ)V

    return-void
.end method

.method public static doDump(Ljava/lang/String;)V
    .locals 10
    .param p0, "cmds"    # Ljava/lang/String;

    .prologue
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .local v5, "object":Lorg/json/JSONObject;
    const-string v8, "dump_service"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .local v6, "service":Ljava/lang/String;
    const-string v8, "args"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .local v1, "array":Lorg/json/JSONArray;
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v7

    .local v7, "size":I
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v8

    new-array v0, v8, [Ljava/lang/String;

    .local v0, "args":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v7, :cond_0

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "opt"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    invoke-static {v6}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .local v2, "binder":Landroid/os/IBinder;
    :try_start_1
    sget-object v8, Ljava/io/FileDescriptor;->out:Ljava/io/FileDescriptor;

    invoke-interface {v2, v8, v0}, Landroid/os/IBinder;->dump(Ljava/io/FileDescriptor;[Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v0    # "args":[Ljava/lang/String;
    .end local v1    # "array":Lorg/json/JSONArray;
    .end local v2    # "binder":Landroid/os/IBinder;
    .end local v4    # "i":I
    .end local v5    # "object":Lorg/json/JSONObject;
    .end local v6    # "service":Ljava/lang/String;
    .end local v7    # "size":I
    :goto_1
    return-void

    .restart local v0    # "args":[Ljava/lang/String;
    .restart local v1    # "array":Lorg/json/JSONArray;
    .restart local v2    # "binder":Landroid/os/IBinder;
    .restart local v4    # "i":I
    .restart local v5    # "object":Lorg/json/JSONObject;
    .restart local v6    # "service":Ljava/lang/String;
    .restart local v7    # "size":I
    :catch_0
    move-exception v3

    .local v3, "e":Landroid/os/RemoteException;
    :try_start_2
    const-string v8, "AnrMonitor"

    const-string v9, "dump failed"

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .end local v0    # "args":[Ljava/lang/String;
    .end local v1    # "array":Lorg/json/JSONArray;
    .end local v2    # "binder":Landroid/os/IBinder;
    .end local v3    # "e":Landroid/os/RemoteException;
    .end local v4    # "i":I
    .end local v5    # "object":Lorg/json/JSONObject;
    .end local v6    # "service":Ljava/lang/String;
    .end local v7    # "size":I
    :catch_1
    move-exception v3

    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public static dumpAnrInfo(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;ILjava/util/ArrayList;Landroid/util/SparseArray;[Ljava/lang/String;ZZ)Ljava/io/File;
    .locals 22
    .param p0, "oriInfo"    # Ljava/lang/StringBuilder;
    .param p1, "extraInfo"    # Ljava/lang/String;
    .param p2, "anrProcessName"    # Ljava/lang/String;
    .param p3, "anrPid"    # I
    .param p6, "nativeProcs"    # [Ljava/lang/String;
    .param p7, "isMonkeyTest"    # Z
    .param p8, "bgAnr"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/Boolean;",
            ">;[",
            "Ljava/lang/String;",
            "ZZ)",
            "Ljava/io/File;"
        }
    .end annotation

    .prologue
    .local p4, "firstPids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .local p5, "lastPids":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/Boolean;>;"
    const/16 v16, 0x0

    .local v16, "writer":Ljava/io/FileWriter;
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v14

    .local v14, "start":J
    move/from16 v0, p8

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Landroid/os/AnrMonitor;->getAnrPath(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .local v7, "filePath":Ljava/lang/String;
    invoke-static {v7}, Landroid/os/AnrMonitor;->createFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    .local v6, "file":Ljava/io/File;
    invoke-static {v6}, Landroid/os/AnrMonitor;->isFileAvailable(Ljava/io/File;)Z

    move-result v18

    if-eqz v18, :cond_5

    new-instance v17, Ljava/io/FileWriter;

    const/16 v18, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v6, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v16    # "writer":Ljava/io/FileWriter;
    .local v17, "writer":Ljava/io/FileWriter;
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    if-eqz p7, :cond_0

    invoke-virtual/range {p0 .. p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    if-eqz p4, :cond_2

    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v11

    .local v11, "num":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    if-ge v8, v11, :cond_2

    move-object/from16 v0, p4

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/Integer;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .local v12, "pid":I
    move/from16 v0, p3

    if-ne v0, v12, :cond_1

    move-object/from16 v0, v17

    invoke-static {v12, v0}, Landroid/os/AnrMonitor;->dumpCpuInfo(ILjava/io/Writer;)V

    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .end local v8    # "i":I
    .end local v11    # "num":I
    .end local v12    # "pid":I
    :cond_2
    if-eqz p6, :cond_3

    invoke-static/range {p6 .. p6}, Landroid/os/Process;->getPidsForCommands([Ljava/lang/String;)[I

    move-result-object v13

    .local v13, "pids":[I
    if-eqz v13, :cond_3

    move-object v4, v13

    .local v4, "arr$":[I
    array-length v10, v4

    .local v10, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_1
    if-ge v9, v10, :cond_3

    aget v12, v4, v9

    .restart local v12    # "pid":I
    move-object/from16 v0, v17

    invoke-static {v12, v0}, Landroid/os/AnrMonitor;->dumpCpuInfo(ILjava/io/Writer;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .end local v4    # "arr$":[I
    .end local v9    # "i$":I
    .end local v10    # "len$":I
    .end local v12    # "pid":I
    .end local v13    # "pids":[I
    :cond_3
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v19, Landroid/os/AnrMonitor;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "(dump anr info success and took "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v20

    sub-long v20, v20, v14

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "ms)"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v17, :cond_4

    :try_start_2
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    :cond_4
    :goto_2
    move-object/from16 v16, v17

    .end local v6    # "file":Ljava/io/File;
    .end local v7    # "filePath":Ljava/lang/String;
    .end local v14    # "start":J
    .end local v17    # "writer":Ljava/io/FileWriter;
    .restart local v16    # "writer":Ljava/io/FileWriter;
    :goto_3
    return-object v6

    .restart local v6    # "file":Ljava/io/File;
    .restart local v7    # "filePath":Ljava/lang/String;
    .restart local v14    # "start":J
    :cond_5
    if-eqz v16, :cond_6

    :try_start_3
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileWriter;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .end local v6    # "file":Ljava/io/File;
    .end local v7    # "filePath":Ljava/lang/String;
    .end local v14    # "start":J
    :cond_6
    :goto_4
    const/4 v6, 0x0

    goto :goto_3

    :catch_0
    move-exception v5

    .local v5, "e":Ljava/lang/Exception;
    :goto_5
    :try_start_4
    const-string v18, "AnrMonitor"

    const-string v19, "Error happens when dumping anr info"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v16, :cond_6

    :try_start_5
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_4

    :catch_1
    move-exception v18

    goto :goto_4

    .end local v5    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v18

    :goto_6
    if-eqz v16, :cond_7

    :try_start_6
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileWriter;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    :cond_7
    :goto_7
    throw v18

    .end local v16    # "writer":Ljava/io/FileWriter;
    .restart local v6    # "file":Ljava/io/File;
    .restart local v7    # "filePath":Ljava/lang/String;
    .restart local v14    # "start":J
    .restart local v17    # "writer":Ljava/io/FileWriter;
    :catch_2
    move-exception v18

    goto :goto_2

    .end local v17    # "writer":Ljava/io/FileWriter;
    .restart local v16    # "writer":Ljava/io/FileWriter;
    :catch_3
    move-exception v18

    goto :goto_4

    .end local v6    # "file":Ljava/io/File;
    .end local v7    # "filePath":Ljava/lang/String;
    .end local v14    # "start":J
    :catch_4
    move-exception v19

    goto :goto_7

    .end local v16    # "writer":Ljava/io/FileWriter;
    .restart local v6    # "file":Ljava/io/File;
    .restart local v7    # "filePath":Ljava/lang/String;
    .restart local v14    # "start":J
    .restart local v17    # "writer":Ljava/io/FileWriter;
    :catchall_1
    move-exception v18

    move-object/from16 v16, v17

    .end local v17    # "writer":Ljava/io/FileWriter;
    .restart local v16    # "writer":Ljava/io/FileWriter;
    goto :goto_6

    .end local v16    # "writer":Ljava/io/FileWriter;
    .restart local v17    # "writer":Ljava/io/FileWriter;
    :catch_5
    move-exception v5

    move-object/from16 v16, v17

    .end local v17    # "writer":Ljava/io/FileWriter;
    .restart local v16    # "writer":Ljava/io/FileWriter;
    goto :goto_5
.end method

.method public static dumpBinderInfo(ILjava/io/Writer;)V
    .locals 4
    .param p0, "pid"    # I
    .param p1, "writer"    # Ljava/io/Writer;

    .prologue
    :try_start_0
    const-string v1, "/sys/kernel/debug/binder/failed_transaction_log"

    .local v1, "srcPath":Ljava/lang/String;
    invoke-static {v1, p1}, Landroid/os/AnrMonitor;->readFileToWriter(Ljava/lang/String;Ljava/io/Writer;)V

    const-string v1, "/sys/kernel/debug/binder/transaction_log"

    invoke-static {v1, p1}, Landroid/os/AnrMonitor;->readFileToWriter(Ljava/lang/String;Ljava/io/Writer;)V

    const-string v1, "/sys/kernel/debug/binder/transactions"

    invoke-static {v1, p1}, Landroid/os/AnrMonitor;->readFileToWriter(Ljava/lang/String;Ljava/io/Writer;)V

    const-string v1, "/sys/kernel/debug/binder/stats"

    invoke-static {v1, p1}, Landroid/os/AnrMonitor;->readFileToWriter(Ljava/lang/String;Ljava/io/Writer;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/sys/kernel/debug/binder/proc/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/os/AnrMonitor;->readFileToWriter(Ljava/lang/String;Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "srcPath":Ljava/lang/String;
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    const-string v2, "AnrMonitor"

    const-string v3, "dumpBinderInfo fail"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static dumpCpuInfo(ILjava/io/Writer;)V
    .locals 4
    .param p0, "pid"    # I
    .param p1, "writer"    # Ljava/io/Writer;

    .prologue
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/proc/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/schedstat"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .local v1, "srcPath":Ljava/lang/String;
    invoke-static {v1, p1}, Landroid/os/AnrMonitor;->readFileToWriter(Ljava/lang/String;Ljava/io/Writer;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/proc/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/stat"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/os/AnrMonitor;->readFileToWriter(Ljava/lang/String;Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "srcPath":Ljava/lang/String;
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    const-string v2, "AnrMonitor"

    const-string v3, "dumpCpuInfo fail"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static finishMonitor(Landroid/os/Message;Landroid/os/BaseLooper$MessageMonitorInfo;)V
    .locals 3
    .param p0, "msg"    # Landroid/os/Message;
    .param p1, "monitorInfo"    # Landroid/os/BaseLooper$MessageMonitorInfo;

    .prologue
    invoke-static {}, Landroid/os/AnrMonitor;->canMonitorMessage()Z

    move-result v1

    if-nez v1, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/os/BaseLooper$MessageMonitorInfo;->getMonitorDigest()Ljava/lang/String;

    move-result-object v0

    .local v0, "digest":Ljava/lang/String;
    invoke-static {}, Landroid/os/AnrMonitor;->getWorkHandler()Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method private static getAnrPath(ZLjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "bgAnr"    # Z
    .param p1, "anrProcessName"    # Ljava/lang/String;

    .prologue
    const-string v0, ""

    .local v0, "extraInfoFileName":Ljava/lang/String;
    if-eqz p0, :cond_0

    const-string v0, "anr_info.txt"

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/data/anr/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "anr_info_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Landroid/os/AnrMonitor;->toCalendarTime(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".txt"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static getWorkHandler()Landroid/os/Handler;
    .locals 4

    .prologue
    sget-object v1, Landroid/os/AnrMonitor;->sWorkHandler:Landroid/os/AnrMonitor$WorkHandler;

    if-nez v1, :cond_1

    sget-object v2, Landroid/os/AnrMonitor;->sInstanceSync:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    sget-object v1, Landroid/os/AnrMonitor;->sWorkHandler:Landroid/os/AnrMonitor$WorkHandler;

    if-nez v1, :cond_0

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "work-thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .local v0, "monitorThread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Landroid/os/AnrMonitor$WorkHandler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/os/AnrMonitor$WorkHandler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Landroid/os/AnrMonitor;->sWorkHandler:Landroid/os/AnrMonitor$WorkHandler;

    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v1, Landroid/os/AnrMonitor;->sWorkHandler:Landroid/os/AnrMonitor$WorkHandler;

    return-object v1

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private static inputChannelToString(Landroid/view/InputChannel;)Ljava/lang/String;
    .locals 5
    .param p0, "inputChannel"    # Landroid/view/InputChannel;

    .prologue
    if-nez p0, :cond_1

    :try_start_0
    const-string v1, "null"

    :cond_0
    :goto_0
    return-object v1

    :cond_1
    invoke-virtual {p0}, Landroid/view/InputChannel;->getName()Ljava/lang/String;

    move-result-object v1

    .local v1, "inputChannelName":Ljava/lang/String;
    const-string v3, "uninitialized"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v1, "uninitialized"

    goto :goto_0

    :cond_2
    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .local v2, "splitResult":[Ljava/lang/String;
    array-length v3, v2

    const/4 v4, 0x2

    if-lt v3, v4, :cond_0

    array-length v3, v2

    add-int/lit8 v3, v3, -0x2

    aget-object v1, v2, v3
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v1    # "inputChannelName":Ljava/lang/String;
    .end local v2    # "splitResult":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    const-string v3, "Error getting inputChannel name "

    invoke-static {v3, v0}, Landroid/os/AnrMonitor;->logAnr(Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string v1, "null"

    goto :goto_0
.end method

.method private static inputEventToString(Landroid/view/InputEvent;)Ljava/lang/String;
    .locals 5
    .param p0, "event"    # Landroid/view/InputEvent;

    .prologue
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .local v2, "msg":Ljava/lang/StringBuilder;
    instance-of v3, p0, Landroid/view/KeyEvent;

    if-eqz v3, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/view/KeyEvent;

    .local v0, "keyEvent":Landroid/view/KeyEvent;
    const-string v3, "KeyEvent { action="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/view/KeyEvent;->getAction()I

    move-result v4

    invoke-static {v4}, Landroid/view/KeyEvent;->actionToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", keyCode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    invoke-static {v4}, Landroid/view/KeyEvent;->keyCodeToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " }"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .end local v0    # "keyEvent":Landroid/view/KeyEvent;
    :goto_0
    return-object v3

    :cond_0
    move-object v1, p0

    check-cast v1, Landroid/view/MotionEvent;

    .local v1, "motionEvent":Landroid/view/MotionEvent;
    const-string v3, "MotionEvent { action="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    invoke-static {v4}, Landroid/view/MotionEvent;->actionToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " }"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method private static isAllowedMonitor(Landroid/os/BaseLooper;)Z
    .locals 2
    .param p0, "looper"    # Landroid/os/BaseLooper;

    .prologue
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/os/BaseLooper;->isMonitorLooper()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isAllowedMonitorBinderCall(Landroid/os/BaseLooper;)Z
    .locals 1
    .param p0, "looper"    # Landroid/os/BaseLooper;

    .prologue
    invoke-static {p0}, Landroid/os/AnrMonitor;->isAllowedMonitor(Landroid/os/BaseLooper;)Z

    move-result v0

    return v0
.end method

.method public static isAllowedMonitorInput(Landroid/os/BaseLooper;)Z
    .locals 1
    .param p0, "looper"    # Landroid/os/BaseLooper;

    .prologue
    invoke-static {p0}, Landroid/os/AnrMonitor;->isAllowedMonitor(Landroid/os/BaseLooper;)Z

    move-result v0

    return v0
.end method

.method public static isFileAvailable(Ljava/io/File;)Z
    .locals 1
    .param p0, "file"    # Ljava/io/File;

    .prologue
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isLongTimeMsg(Landroid/os/BaseLooper$MessageMonitorInfo;)Z
    .locals 4
    .param p0, "monitorInfo"    # Landroid/os/BaseLooper$MessageMonitorInfo;

    .prologue
    invoke-virtual {p0}, Landroid/os/BaseLooper$MessageMonitorInfo;->getTookTime()J

    move-result-wide v0

    .local v0, "tookTime":J
    const-wide/16 v2, 0xc8

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    const-wide/32 v2, 0x186a0

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method static declared-synchronized isSystemApp()Z
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const-class v6, Landroid/os/AnrMonitor;

    monitor-enter v6

    :try_start_0
    sget-object v7, Landroid/os/AnrMonitor;->sIsSystemApp:Ljava/lang/Boolean;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v7, :cond_1

    :try_start_1
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .local v1, "info":Landroid/content/pm/PackageInfo;
    if-eqz v1, :cond_1

    iget-object v7, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v7, :cond_1

    iget-object v7, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v7, v7, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v7, v7, 0x1

    if-eqz v7, :cond_2

    move v2, v5

    .local v2, "isSystemApp":Z
    :goto_0
    iget-object v7, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v7, v7, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v7, v7, 0x80

    if-eqz v7, :cond_3

    move v3, v5

    .local v3, "isSystemUpdateApp":Z
    :goto_1
    new-instance v7, Ljava/lang/Boolean;

    if-nez v2, :cond_0

    if-eqz v3, :cond_4

    :cond_0
    :goto_2
    invoke-direct {v7, v5}, Ljava/lang/Boolean;-><init>(Z)V

    sput-object v7, Landroid/os/AnrMonitor;->sIsSystemApp:Ljava/lang/Boolean;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v2    # "isSystemApp":Z
    .end local v3    # "isSystemUpdateApp":Z
    :cond_1
    :goto_3
    :try_start_2
    sget-object v5, Landroid/os/AnrMonitor;->sIsSystemApp:Ljava/lang/Boolean;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v5, :cond_5

    :goto_4
    monitor-exit v6

    return v4

    .restart local v1    # "info":Landroid/content/pm/PackageInfo;
    :cond_2
    move v2, v4

    goto :goto_0

    .restart local v2    # "isSystemApp":Z
    :cond_3
    move v3, v4

    goto :goto_1

    .restart local v3    # "isSystemUpdateApp":Z
    :cond_4
    move v5, v4

    goto :goto_2

    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v2    # "isSystemApp":Z
    .end local v3    # "isSystemUpdateApp":Z
    :cond_5
    :try_start_3
    sget-object v4, Landroid/os/AnrMonitor;->sIsSystemApp:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v4

    goto :goto_4

    :catchall_0
    move-exception v4

    monitor-exit v6

    throw v4

    :catch_0
    move-exception v5

    goto :goto_3
.end method

.method private static isSystemBootCompleted()Z
    .locals 2

    .prologue
    sget-boolean v0, Landroid/os/AnrMonitor;->sSystemBootCompleted:Z

    if-nez v0, :cond_0

    const-string v0, "1"

    const-string v1, "sys.boot_completed"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Landroid/os/AnrMonitor;->sSystemBootCompleted:Z

    :cond_0
    sget-boolean v0, Landroid/os/AnrMonitor;->sSystemBootCompleted:Z

    return v0
.end method

.method static declared-synchronized isSystemServer()Z
    .locals 3

    .prologue
    const-class v1, Landroid/os/AnrMonitor;

    monitor-enter v1

    :try_start_0
    const-string v0, "system_server"

    invoke-static {}, Landroid/os/AnrMonitor;->currentPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static logAnr(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    if-eqz p1, :cond_0

    const-string v0, "MIUI-BLOCK-MONITOR"

    invoke-static {v0, p0, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :cond_0
    const-string v0, "MIUI-BLOCK-MONITOR"

    invoke-static {v0, p0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static logDumpTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    if-eqz p1, :cond_0

    const-string v0, "DUMP_APP_TRACE"

    invoke-static {v0, p0, p1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :cond_0
    const-string v0, "DUMP_APP_TRACE"

    invoke-static {v0, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static readFile(Ljava/io/File;)Ljava/lang/String;
    .locals 9
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v3, 0x0

    .local v3, "fileReader":Ljava/io/FileReader;
    const/4 v0, 0x0

    .local v0, "bufferedReader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v3    # "fileReader":Ljava/io/FileReader;
    .local v4, "fileReader":Ljava/io/FileReader;
    :try_start_1
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .local v1, "bufferedReader":Ljava/io/BufferedReader;
    :try_start_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .local v6, "strBuffer":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .local v5, "line":Ljava/lang/String;
    if-eqz v5, :cond_2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Landroid/os/AnrMonitor;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "strBuffer":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v2

    move-object v0, v1

    .end local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    move-object v3, v4

    .end local v4    # "fileReader":Ljava/io/FileReader;
    .local v2, "e":Ljava/lang/Exception;
    .restart local v3    # "fileReader":Ljava/io/FileReader;
    :goto_1
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 v7, 0x0

    if-eqz v0, :cond_0

    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    :cond_0
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_2
    return-object v7

    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v3    # "fileReader":Ljava/io/FileReader;
    .restart local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v4    # "fileReader":Ljava/io/FileReader;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v6    # "strBuffer":Ljava/lang/StringBuilder;
    :cond_2
    :try_start_5
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-result-object v7

    if-eqz v1, :cond_3

    :try_start_6
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    :cond_3
    if-eqz v4, :cond_4

    invoke-virtual {v4}, Ljava/io/FileReader;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    :cond_4
    :goto_3
    move-object v0, v1

    .end local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    move-object v3, v4

    .end local v4    # "fileReader":Ljava/io/FileReader;
    .restart local v3    # "fileReader":Ljava/io/FileReader;
    goto :goto_2

    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v3    # "fileReader":Ljava/io/FileReader;
    .restart local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v4    # "fileReader":Ljava/io/FileReader;
    :catch_1
    move-exception v2

    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .end local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v4    # "fileReader":Ljava/io/FileReader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "strBuffer":Ljava/lang/StringBuilder;
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v3    # "fileReader":Ljava/io/FileReader;
    :catch_2
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :goto_4
    if-eqz v0, :cond_5

    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    :cond_5
    if-eqz v3, :cond_6

    invoke-virtual {v3}, Ljava/io/FileReader;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    :cond_6
    :goto_5
    throw v7

    :catch_3
    move-exception v2

    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "fileReader":Ljava/io/FileReader;
    .restart local v4    # "fileReader":Ljava/io/FileReader;
    :catchall_1
    move-exception v7

    move-object v3, v4

    .end local v4    # "fileReader":Ljava/io/FileReader;
    .restart local v3    # "fileReader":Ljava/io/FileReader;
    goto :goto_4

    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v3    # "fileReader":Ljava/io/FileReader;
    .restart local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v4    # "fileReader":Ljava/io/FileReader;
    :catchall_2
    move-exception v7

    move-object v0, v1

    .end local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    move-object v3, v4

    .end local v4    # "fileReader":Ljava/io/FileReader;
    .restart local v3    # "fileReader":Ljava/io/FileReader;
    goto :goto_4

    :catch_4
    move-exception v2

    goto :goto_1

    .end local v3    # "fileReader":Ljava/io/FileReader;
    .restart local v4    # "fileReader":Ljava/io/FileReader;
    :catch_5
    move-exception v2

    move-object v3, v4

    .end local v4    # "fileReader":Ljava/io/FileReader;
    .restart local v3    # "fileReader":Ljava/io/FileReader;
    goto :goto_1
.end method

.method public static readFileToWriter(Ljava/lang/String;Ljava/io/Writer;)V
    .locals 3
    .param p0, "srcPath"    # Ljava/lang/String;
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v0, "file":Ljava/io/File;
    invoke-static {v0}, Landroid/os/AnrMonitor;->isFileAvailable(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Landroid/os/AnrMonitor;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "------ cat "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ------"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Landroid/os/AnrMonitor;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/os/AnrMonitor;->readFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static renameTraces(Ljava/lang/String;)V
    .locals 9
    .param p0, "processName"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x5

    const-string v5, "dalvik.vm.stack-trace-file"

    const/4 v6, 0x0

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .local v4, "tracesPath":Ljava/lang/String;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v1, "traceRenameFile":Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/data/anr/traces_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Landroid/os/AnrMonitor;->toCalendarTime(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".txt"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, "newTracesPath":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    const/4 v5, 0x0

    const-string v6, "/"

    invoke-virtual {v4, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .local v3, "tracesDirStr":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v2, "tracesDir":Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "traces_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5, v8}, Landroid/os/AnrMonitor;->deleteUnnecessaryFileIfNeeded(Ljava/io/File;Ljava/lang/String;I)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "anr_info_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5, v8}, Landroid/os/AnrMonitor;->deleteUnnecessaryFileIfNeeded(Ljava/io/File;Ljava/lang/String;I)V

    .end local v0    # "newTracesPath":Ljava/lang/String;
    .end local v1    # "traceRenameFile":Ljava/io/File;
    .end local v2    # "tracesDir":Ljava/io/File;
    .end local v3    # "tracesDirStr":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method static startMonitor(Landroid/os/Message;Landroid/os/BaseLooper$MessageMonitorInfo;)V
    .locals 6
    .param p0, "msg"    # Landroid/os/Message;
    .param p1, "monitorInfo"    # Landroid/os/BaseLooper$MessageMonitorInfo;

    .prologue
    invoke-static {}, Landroid/os/AnrMonitor;->canMonitorMessage()Z

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/os/BaseLooper$MessageMonitorInfo;->getMonitorMessage()Ljava/lang/String;

    move-result-object v1

    .local v1, "info":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {}, Landroid/os/AnrMonitor;->getWorkHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v2

    .local v2, "monitorMsg":Landroid/os/Message;
    const/4 v3, 0x1

    iput v3, v2, Landroid/os/Message;->what:I

    invoke-virtual {p1}, Landroid/os/BaseLooper$MessageMonitorInfo;->createMonitorDigest()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .local v0, "b":Landroid/os/Bundle;
    const-string v3, "monitor_msg"

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    invoke-static {}, Landroid/os/AnrMonitor;->getWorkHandler()Landroid/os/Handler;

    move-result-object v3

    const-wide/16 v4, 0x7d0

    invoke-virtual {v3, v2, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0
.end method

.method public static declared-synchronized toCalendarTime(J)Ljava/lang/String;
    .locals 4
    .param p0, "time"    # J

    .prologue
    const-class v1, Landroid/os/AnrMonitor;

    monitor-enter v1

    :try_start_0
    sget-object v0, Landroid/os/AnrMonitor;->DATE:Ljava/util/Date;

    invoke-virtual {v0, p0, p1}, Ljava/util/Date;->setTime(J)V

    sget-object v0, Landroid/os/AnrMonitor;->DATE_FORMATTER:Ljava/text/SimpleDateFormat;

    sget-object v2, Landroid/os/AnrMonitor;->DATE:Ljava/util/Date;

    invoke-virtual {v0, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
