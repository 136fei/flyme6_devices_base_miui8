.class public abstract Lmiui/maml/elements/ViewHolderScreenElement;
.super Lmiui/maml/elements/ElementGroupRC;
.source "ViewHolderScreenElement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/maml/elements/ViewHolderScreenElement$ProxyListener;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "MAML ViewHolderScreenElement"


# instance fields
.field private mHardware:Z

.field private mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

.field protected mUpdatePosition:Z

.field protected mUpdateSize:Z

.field protected mUpdateTranslation:Z

.field private mViewAdded:Z


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/maml/ScreenElementRoot;)V
    .locals 2
    .param p1, "node"    # Lorg/w3c/dom/Element;
    .param p2, "root"    # Lmiui/maml/ScreenElementRoot;

    .prologue
    const/4 v1, 0x1

    invoke-direct {p0, p1, p2}, Lmiui/maml/elements/ElementGroupRC;-><init>(Lorg/w3c/dom/Element;Lmiui/maml/ScreenElementRoot;)V

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getLayoutParam()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput-object v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    const-string v0, "hardware"

    invoke-virtual {p0, p1, v0}, Lmiui/maml/elements/ViewHolderScreenElement;->getAttr(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mHardware:Z

    const-string v0, "updatePosition"

    invoke-virtual {p0, p1, v0}, Lmiui/maml/elements/ViewHolderScreenElement;->getAttr(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Lmiui/maml/elements/ViewHolderScreenElement;->getAttrAsBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mUpdatePosition:Z

    const-string v0, "updateSize"

    invoke-virtual {p0, p1, v0}, Lmiui/maml/elements/ViewHolderScreenElement;->getAttr(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Lmiui/maml/elements/ViewHolderScreenElement;->getAttrAsBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mUpdateSize:Z

    const-string v0, "updateTranslation"

    invoke-virtual {p0, p1, v0}, Lmiui/maml/elements/ViewHolderScreenElement;->getAttr(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Lmiui/maml/elements/ViewHolderScreenElement;->getAttrAsBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mUpdateTranslation:Z

    return-void
.end method

.method static synthetic access$000(Lmiui/maml/elements/ViewHolderScreenElement;)Z
    .locals 1
    .param p0, "x0"    # Lmiui/maml/elements/ViewHolderScreenElement;

    .prologue
    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mViewAdded:Z

    return v0
.end method

.method static synthetic access$002(Lmiui/maml/elements/ViewHolderScreenElement;Z)Z
    .locals 0
    .param p0, "x0"    # Lmiui/maml/elements/ViewHolderScreenElement;
    .param p1, "x1"    # Z

    .prologue
    iput-boolean p1, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mViewAdded:Z

    return p1
.end method

.method static synthetic access$100(Lmiui/maml/elements/ViewHolderScreenElement;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .param p0, "x0"    # Lmiui/maml/elements/ViewHolderScreenElement;

    .prologue
    iget-object v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    return-object v0
.end method

.method static synthetic access$200(Lmiui/maml/elements/ViewHolderScreenElement;)Z
    .locals 1
    .param p0, "x0"    # Lmiui/maml/elements/ViewHolderScreenElement;

    .prologue
    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mHardware:Z

    return v0
.end method

.method private final finishView()V
    .locals 1

    .prologue
    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mViewAdded:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mRoot:Lmiui/maml/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/maml/ScreenElementRoot;->getViewManager()Landroid/view/ViewManager;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Lmiui/maml/elements/ViewHolderScreenElement$4;

    invoke-direct {v0, p0}, Lmiui/maml/elements/ViewHolderScreenElement$4;-><init>(Lmiui/maml/elements/ViewHolderScreenElement;)V

    invoke-virtual {p0, v0}, Lmiui/maml/elements/ViewHolderScreenElement;->postInMainThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method private static getAttrAsBoolean(Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "att"    # Ljava/lang/String;
    .param p1, "def"    # Z

    .prologue
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .end local p1    # "def":Z
    :goto_0
    return p1

    .restart local p1    # "def":Z
    :cond_0
    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    goto :goto_0
.end method

.method private final initView()V
    .locals 1

    .prologue
    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mViewAdded:Z

    if-nez v0, :cond_0

    new-instance v0, Lmiui/maml/elements/ViewHolderScreenElement$3;

    invoke-direct {v0, p0}, Lmiui/maml/elements/ViewHolderScreenElement$3;-><init>(Lmiui/maml/elements/ViewHolderScreenElement;)V

    invoke-virtual {p0, v0}, Lmiui/maml/elements/ViewHolderScreenElement;->postInMainThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method private updateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 4
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v0, 0x0

    .local v0, "changed":Z
    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getWidth()F

    move-result v3

    float-to-int v2, v3

    .local v2, "width":I
    iget v3, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-eq v3, v2, :cond_0

    iput v2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getHeight()F

    move-result v3

    float-to-int v1, v3

    .local v1, "height":I
    iget v3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v3, v1, :cond_1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v0, 0x1

    :cond_1
    return v0
.end method


# virtual methods
.method protected doTick(J)V
    .locals 1
    .param p1, "currentTime"    # J

    .prologue
    iget-object v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mController:Lmiui/maml/RendererController;

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Lmiui/maml/elements/ElementGroupRC;->doTick(J)V

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    :goto_0
    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->udpateView()V

    return-void

    :cond_0
    invoke-virtual {p0, p1, p2}, Lmiui/maml/elements/ViewHolderScreenElement;->doTickSelf(J)V

    goto :goto_0
.end method

.method protected doTickSelf(J)V
    .locals 3
    .param p1, "currentTime"    # J

    .prologue
    iget-object v2, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mAnimations:Ljava/util/ArrayList;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    iget-object v2, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmiui/maml/animation/BaseAnimation;

    invoke-virtual {v2, p1, p2}, Lmiui/maml/animation/BaseAnimation;->tick(J)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0    # "N":I
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->evaluateAlpha()I

    move-result v2

    iput v2, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mAlpha:I

    iget v2, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mAlpha:I

    if-gez v2, :cond_1

    const/4 v2, 0x0

    :goto_1
    iput v2, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mAlpha:I

    return-void

    :cond_1
    iget v2, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mAlpha:I

    goto :goto_1
.end method

.method public finish()V
    .locals 0

    .prologue
    invoke-super {p0}, Lmiui/maml/elements/ElementGroupRC;->finish()V

    invoke-direct {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->finishView()V

    return-void
.end method

.method protected getLayoutParam()Landroid/view/ViewGroup$LayoutParams;
    .locals 2

    .prologue
    const/4 v1, -0x1

    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/view/WindowManager$LayoutParams;-><init>(II)V

    .local v0, "lp":Landroid/view/WindowManager$LayoutParams;
    const/4 v1, 0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    const/16 v1, 0x100

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    return-object v0
.end method

.method protected abstract getView()Landroid/view/View;
.end method

.method public init()V
    .locals 2

    .prologue
    invoke-super {p0}, Lmiui/maml/elements/ElementGroupRC;->init()V

    iget-object v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mRoot:Lmiui/maml/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/maml/ScreenElementRoot;->getViewManager()Landroid/view/ViewManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->initView()V

    :goto_0
    return-void

    :cond_0
    const-string v0, "MAML ViewHolderScreenElement"

    const-string v1, "ViewManager must be set before init"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected isViewAdded()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mViewAdded:Z

    return v0
.end method

.method protected onControllerCreated(Lmiui/maml/RendererController;)V
    .locals 2
    .param p1, "c"    # Lmiui/maml/RendererController;

    .prologue
    new-instance v0, Lmiui/maml/elements/ViewHolderScreenElement$ProxyListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lmiui/maml/elements/ViewHolderScreenElement$ProxyListener;-><init>(Lmiui/maml/elements/ViewHolderScreenElement;Lmiui/maml/elements/ViewHolderScreenElement$1;)V

    invoke-virtual {p1, v0}, Lmiui/maml/RendererController;->setListener(Lmiui/maml/RendererController$Listener;)V

    return-void
.end method

.method protected onUpdateView(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mUpdatePosition:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getAbsoluteLeft()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setX(F)V

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getAbsoluteTop()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setY(F)V

    :cond_0
    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mUpdateTranslation:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getPivotX()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotX(F)V

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getPivotY()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotY(F)V

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getRotation()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setRotation(F)V

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getRotationX()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setRotationX(F)V

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getRotationY()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setRotationY(F)V

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getAlpha()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getScaleX()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p0}, Lmiui/maml/elements/ViewHolderScreenElement;->getScaleY()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    :cond_1
    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mUpdateSize:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {p0, v0}, Lmiui/maml/elements/ViewHolderScreenElement;->updateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_2
    return-void
.end method

.method protected onViewAdded(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    return-void
.end method

.method protected onViewRemoved(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    return-void
.end method

.method protected onVisibilityChange(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    move v0, p1

    .local v0, "_v":Z
    new-instance v1, Lmiui/maml/elements/ViewHolderScreenElement$5;

    invoke-direct {v1, p0, v0}, Lmiui/maml/elements/ViewHolderScreenElement$5;-><init>(Lmiui/maml/elements/ViewHolderScreenElement;Z)V

    invoke-virtual {p0, v1}, Lmiui/maml/elements/ViewHolderScreenElement;->postInMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public render(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    return-void
.end method

.method public setHardwareLayer(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    new-instance v0, Lmiui/maml/elements/ViewHolderScreenElement$1;

    invoke-direct {v0, p0, p1}, Lmiui/maml/elements/ViewHolderScreenElement$1;-><init>(Lmiui/maml/elements/ViewHolderScreenElement;Z)V

    invoke-virtual {p0, v0}, Lmiui/maml/elements/ViewHolderScreenElement;->postInMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected udpateView()V
    .locals 1

    .prologue
    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mUpdatePosition:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mUpdateTranslation:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lmiui/maml/elements/ViewHolderScreenElement;->mUpdateSize:Z

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Lmiui/maml/elements/ViewHolderScreenElement$2;

    invoke-direct {v0, p0}, Lmiui/maml/elements/ViewHolderScreenElement$2;-><init>(Lmiui/maml/elements/ViewHolderScreenElement;)V

    invoke-virtual {p0, v0}, Lmiui/maml/elements/ViewHolderScreenElement;->postInMainThread(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method
