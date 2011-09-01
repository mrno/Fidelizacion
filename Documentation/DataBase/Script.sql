--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      Logística Financiera S.A.
-- Project :      Red de Televisión.dm1
-- Author :       Alejandro A. Llerandi
--
-- Date Created : Monday, July 25, 2011 10:37:04
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Asientos 
--

CREATE TABLE Asientos(
    AsiId                                   BIGINT            NOT NULL,
    TipoAsiId                               BIGINT            NOT NULL,
    UniNegId                                BIGINT            NOT NULL,
    TerOpId                                 BIGINT            NOT NULL,
    TarId                                   BIGINT            NOT NULL,
    ConCenOpId                              BIGINT            NOT NULL,
    AsiFch                                  DATETIME          NOT NULL,
    AsiPtosFidelizacion                     DECIMAL(10, 2)    NOT NULL,
    AsiValorDescuentoCliente                DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    AsiTasaCargoCargaPtos                   DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    AsiTasaCargoDescargaPtos                DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    AsiRelacionPesoPunto                    DECIMAL(7, 2)     NOT NULL,
    AsiTasaDescVtas                         DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    AsiTasaInteresesPositivosAdelantados    DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    AsiImporteCompra                        DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    AsiFchAnulacion                         DATETIME,
    PRIMARY KEY (AsiId)
)ENGINE=INNODB
;



-- 
-- TABLE: AsignacionFuncionesTerminalesOperacion 
--

CREATE TABLE AsignacionFuncionesTerminalesOperacion(
    TerOpId               BIGINT      NOT NULL,
    FunTerOpId            BIGINT      NOT NULL,
    AsiFunTerOpFchAlta    DATETIME    NOT NULL,
    AsiFunTerOpFchBaja    DATETIME,
    PRIMARY KEY (TerOpId, FunTerOpId)
)ENGINE=INNODB
;



-- 
-- TABLE: AsociacionesUnidadNegocio 
--

CREATE TABLE AsociacionesUnidadNegocio(
    UniNegId                           BIGINT            NOT NULL,
    PerId                              BIGINT            NOT NULL,
    TipoCliId                          BIGINT            NOT NULL,
    AsoUniNegCliId                     VARCHAR(80),
    AsoUniNegFchAlta                   DATETIME          NOT NULL,
    AsoUniNegFchBaja                   DATETIME,
    AsoUniNegPtosIniciales             DECIMAL(10, 2)    NOT NULL,
    AsoUniNegPtosDisponibles           DECIMAL(10, 2)    NOT NULL,
    AsoUniNegSaldoInicial              DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    AsoUniNegSaldoActual               DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    AsoUniNegLimConsumo                DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    AsoUniNegLimConsumoMensual         DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    AsoUniNegSaldoInicialConsumo       DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    AsoUniNegSaldoDisponibleConsumo    DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    AsoUniNegLimAdelantoEfectivo       DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    AsoUniNegIdUltimaLiquidacion       BIGINT            DEFAULT 0 NOT NULL,
    AsoUniNegIdUltimoResumen           BIGINT            DEFAULT 0 NOT NULL,
    PRIMARY KEY (UniNegId, PerId)
)ENGINE=INNODB
;



-- 
-- TABLE: Barrios 
--

CREATE TABLE Barrios(
    BarId     BIGINT         NOT NULL,
    CiuId     BIGINT         NOT NULL,
    BarNom    VARCHAR(80)    NOT NULL,
    PRIMARY KEY (BarId)
)ENGINE=INNODB
;



-- 
-- TABLE: CentrosOperaciones 
--

CREATE TABLE CentrosOperaciones(
    CenOpId              BIGINT          NOT NULL,
    CenOpRazonSocial     VARCHAR(80)     NOT NULL,
    CenOpTitular         VARCHAR(80)     NOT NULL,
    CenOpDirCalle        VARCHAR(100),
    CenOpDirCalleNum     VARCHAR(10),
    CenOpDirPiso         VARCHAR(3),
    CenOpDirDpto         VARCHAR(3),
    CiuId                BIGINT          NOT NULL,
    CenOpTel             VARCHAR(25),
    CenOpFax             VARCHAR(25),
    CenOpMail            VARCHAR(100),
    PosFisId             BIGINT          NOT NULL,
    CenOpCuit            VARCHAR(15),
    CenOpCodSeguridad    VARCHAR(30),
    CenOpFchAlta         DATETIME        NOT NULL,
    CenOpFchBaja         DATETIME,
    RubComId             BIGINT          NOT NULL,
    PRIMARY KEY (CenOpId)
)ENGINE=INNODB
;



-- 
-- TABLE: Ciudades 
--

CREATE TABLE Ciudades(
    CiuId        BIGINT         NOT NULL,
    ProvId       BIGINT         NOT NULL,
    CiuNom       VARCHAR(80)    NOT NULL,
    CiuCodPos    VARCHAR(20),
    PRIMARY KEY (CiuId)
)ENGINE=INNODB
;



-- 
-- TABLE: ConceptosCargosFijos 
--

CREATE TABLE ConceptosCargosFijos(
    ConCarFiId         BIGINT           NOT NULL,
    UniNegId           BIGINT           NOT NULL,
    ConCarFiNom        VARCHAR(80)      NOT NULL,
    ConCarFiImporte    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    PRIMARY KEY (ConCarFiId)
)ENGINE=INNODB
;



-- 
-- TABLE: ConceptosDebitadosAutomaticamente 
--

CREATE TABLE ConceptosDebitadosAutomaticamente(
    TarId                BIGINT      NOT NULL,
    ConCarFiId           BIGINT      NOT NULL,
    ConDebAutoFchIni     DATETIME    NOT NULL,
    ConDebAutoFchFin     DATETIME    NOT NULL,
    ConDebAutoFchBaja    DATETIME,
    PRIMARY KEY (TarId, ConCarFiId)
)ENGINE=INNODB
;



-- 
-- TABLE: ConveniosCentrosOperaciones 
--

CREATE TABLE ConveniosCentrosOperaciones(
    ConCenOpId                            BIGINT            NOT NULL,
    ConCenOpNom                           VARCHAR(80)       NOT NULL,
    UniNegId                              BIGINT            NOT NULL,
    CenOpId                               BIGINT            NOT NULL,
    ConCenOpFchInicio                     DATETIME          NOT NULL,
    ConCenOpFchFin                        DATETIME          NOT NULL,
    ConCenOpFchBaja                       DATETIME,
    ConCenOpPrecioPunto                   DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    ConCenOpValorDescuentoCliente         DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    ConCenOpLimPtosDescubierto            DECIMAL(10, 2)    NOT NULL,
    ConCenOpPtosDescubiertoDisponibles    DECIMAL(10, 2)    NOT NULL,
    ConCenOpPtosDisponibles               DECIMAL(10, 2)    NOT NULL,
    ConCenOpPtosOtorgados                 DECIMAL(10, 2)    NOT NULL,
    ConCenOpCargoFijoLiquidacion          DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    ConCenOpTasaCargoVariableDescuento    DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    ConCenOpTasaCargoVariableAdelanto     DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    ConCenOpTasaCargoCargaPtos            DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    ConCenOpTasaCargoDescargaPtos         DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    ConCenOpTasaDescVtas                  DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    ConCenOpTasaDescPagoExpress           DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    ConCenOpTasaDescImportesCobros        DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    ConCenOpPtosCostosCobroResumen        DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    ConCenOpIdUltimoResumen               BIGINT            DEFAULT 0 NOT NULL,
    PRIMARY KEY (ConCenOpId)
)ENGINE=INNODB
;



-- 
-- TABLE: CuentasAsiento 
--

CREATE TABLE CuentasAsiento(
    AsiId          BIGINT           NOT NULL,
    CtaContId      BIGINT           NOT NULL,
    CtaAsiDebe     DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    CtaAsiHaber    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    PRIMARY KEY (AsiId, CtaContId)
)ENGINE=INNODB
;



-- 
-- TABLE: CuentasContabilidad 
--

CREATE TABLE CuentasContabilidad(
    CtaContId          BIGINT         NOT NULL,
    CtaConNom          VARCHAR(80)    NOT NULL,
    CtaConJerarquia    VARCHAR(40),
    PRIMARY KEY (CtaContId)
)ENGINE=INNODB
;



-- 
-- TABLE: CuotasCompras 
--

CREATE TABLE CuotasCompras(
    AsiId                         BIGINT           NOT NULL,
    CuoComId                      BIGINT           NOT NULL,
    CuoComImporte                 DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    CuoComCuota                   DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    CuoComComponenteFinanciero    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    CuoComAmortizacion            DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    CuoComSaldo                   DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    CuoComMes                     INT              NOT NULL,
    CuoComAno                     INT              NOT NULL,
    CuoComFchPago                 DATETIME,
    PRIMARY KEY (AsiId, CuoComId)
)ENGINE=INNODB
;



-- 
-- TABLE: DispositivosEntrada 
--

CREATE TABLE DispositivosEntrada(
    DisEntId                  BIGINT         NOT NULL,
    DisEntIdHw                VARCHAR(80)    NOT NULL,
    DisEntTipoDispositivo     BIGINT         NOT NULL,
    DisEntEstado              BIGINT         NOT NULL,
    DisEntFchAlta             DATETIME       NOT NULL,
    DisEntFchBaja             DATETIME,
    DisEntFchEntregaUniNeg    DATETIME,
    DisEntFchEntregaCenOp     DATETIME,
    UniNegId                  BIGINT         NOT NULL,
    TerOpId                   BIGINT         NOT NULL,
    PRIMARY KEY (DisEntId)
)ENGINE=INNODB
;



-- 
-- TABLE: EmpresasCelular 
--

CREATE TABLE EmpresasCelular(
    EmpCelId     BIGINT         NOT NULL,
    EmpCelNom    VARCHAR(80)    NOT NULL,
    PRIMARY KEY (EmpCelId)
)ENGINE=INNODB
;



-- 
-- TABLE: FuncionesSistema 
--

CREATE TABLE FuncionesSistema(
    FunSisId      BIGINT         NOT NULL,
    FunSisNom     VARCHAR(80)    NOT NULL,
    FunSisDesc    TEXT,
    PRIMARY KEY (FunSisId)
)ENGINE=INNODB
;



-- 
-- TABLE: FuncionesSistemaTipoUsuario 
--

CREATE TABLE FuncionesSistemaTipoUsuario(
    TipoUsuId                    BIGINT    NOT NULL,
    FunSisId                     BIGINT    NOT NULL,
    FunSisTipoUsuLectura         INT,
    FunSisTipoUsuAlta            INT,
    FunSisTipoUsuModificacion    INT,
    FunSisTipoUsuEliminacion     INT,
    PRIMARY KEY (TipoUsuId, FunSisId)
)ENGINE=INNODB
;



-- 
-- TABLE: FuncionesTerminalesOperacion 
--

CREATE TABLE FuncionesTerminalesOperacion(
    FunTerOpId     BIGINT         NOT NULL,
    FunTerOpNom    VARCHAR(80)    NOT NULL,
    PRIMARY KEY (FunTerOpId)
)ENGINE=INNODB
;



-- 
-- TABLE: IdsOtorgados 
--

CREATE TABLE IdsOtorgados(
    IdsTablaId           BIGINT         NOT NULL,
    IdsTablaNomFisico    VARCHAR(80)    NOT NULL,
    IdsUltimoId          BIGINT         NOT NULL,
    PRIMARY KEY (IdsTablaId)
)ENGINE=INNODB
;



-- 
-- TABLE: LiquidacionesCenOp 
--

CREATE TABLE LiquidacionesCenOp(
    LiqCenOpId                           BIGINT           NOT NULL,
    LiqCenOpAsientoLiqCarga              BIGINT,
    LiqCenOpAsiLiqDescarga               BIGINT,
    LiqCenOpSaldo                        DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    LiqCenOpImporteTotPtosCargados       DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    LiqCenOpImporteTotPtosDescargados    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    LiqCenOpTotCargoCargaPtos            DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    LiqCenOpTotCargoDescargaPtos         DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    LiqCenOpImportePagado                DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    LiqCenOpFchPago                      DATETIME,
    LiqCenOpIdLiqAnterior                BIGINT           DEFAULT 0 NOT NULL,
    LiqCenOpIdLiqSiguiente               BIGINT           DEFAULT 0 NOT NULL,
    PRIMARY KEY (LiqCenOpId)
)ENGINE=INNODB
;



-- 
-- TABLE: LiquidacionesCenOpConvenios 
--

CREATE TABLE LiquidacionesCenOpConvenios(
    LiqCenOpId                           BIGINT           NOT NULL,
    ConCenOpId                           BIGINT           NOT NULL,
    LiqCenOpConImportePtosCargados       DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    LiqCenOpConImportePtosDescargados    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    LiqCenOpConCargoCargaPtos            DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    LiqCenOpConCargoDescargaPtos         DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    PRIMARY KEY (LiqCenOpId, ConCenOpId)
)ENGINE=INNODB
;



-- 
-- TABLE: Ocupacion 
--

CREATE TABLE Ocupacion(
    OcuId     BIGINT         NOT NULL,
    OcuNom    VARCHAR(80)    NOT NULL,
    PRIMARY KEY (OcuId)
)ENGINE=INNODB
;



-- 
-- TABLE: Paises 
--

CREATE TABLE Paises(
    PaisId     BIGINT         NOT NULL,
    PaisNom    VARCHAR(80)    NOT NULL,
    PRIMARY KEY (PaisId)
)ENGINE=INNODB
;



-- 
-- TABLE: ParametrosCliente 
--

CREATE TABLE ParametrosCliente(
    RubComId             BIGINT           NOT NULL,
    UniNegId             BIGINT           NOT NULL,
    PerId                BIGINT           NOT NULL,
    ParCliLimMensual1    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ParCliLimMensual2    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ParCliLimTotal       DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    PRIMARY KEY (RubComId, UniNegId, PerId)
)ENGINE=INNODB
;



-- 
-- TABLE: ParametrosTipoCliente 
--

CREATE TABLE ParametrosTipoCliente(
    RubComId                     BIGINT           NOT NULL,
    TipoCliId                    BIGINT           NOT NULL,
    ParTipoCliRangoId            BIGINT           NOT NULL,
    ParTipoCliCuotaNum           INT              NOT NULL,
    ParTipoCliTasaPagoCompras    DECIMAL(7, 3)    DEFAULT 0 NOT NULL,
    PRIMARY KEY (RubComId, TipoCliId, ParTipoCliRangoId)
)ENGINE=INNODB
;



-- 
-- TABLE: ParametrosUnidadNegocio 
--

CREATE TABLE ParametrosUnidadNegocio(
    UniNegId                               BIGINT            NOT NULL,
    CenOpId                                BIGINT            NOT NULL,
    ParUniNegLimPtosDescubierto            DECIMAL(10, 2)    NOT NULL,
    ParUniNegPtosDescubiertoDisponibles    DECIMAL(10, 2)    NOT NULL,
    ParUniNegPtosOtorgados                 DECIMAL(10, 2)    NOT NULL,
    ParUniNegPtosDisponibles               DECIMAL(10, 2)    NOT NULL,
    ParUniNegTasaCargoVariableDescuento    DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    ParUniNegTasaCargoVariableAdelanto     DECIMAL(7, 3)     DEFAULT 0 NOT NULL,
    ParUniNegCargoFijoLiquidacion          DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    ParUniNegIdUltimaLiqCenOp              BIGINT            DEFAULT 0 NOT NULL,
    ParUniNegIdUltimaLiqCreditoCenOp       BIGINT            DEFAULT 0 NOT NULL,
    PRIMARY KEY (UniNegId, CenOpId)
)ENGINE=INNODB
;



-- 
-- TABLE: Personas 
--

CREATE TABLE Personas(
    PerId             BIGINT          NOT NULL,
    PerNom            VARCHAR(80)     NOT NULL,
    PerApe            VARCHAR(80)     NOT NULL,
    PerFchNac         DATETIME        NOT NULL,
    TipoDocId         BIGINT          NOT NULL,
    PerNumDoc         VARCHAR(20)     NOT NULL,
    PerSexo           INT             NOT NULL,
    PerEstadoCivil    INT             NOT NULL,
    CiuId             BIGINT          NOT NULL,
    BarId             BIGINT,
    PerDirCalle       VARCHAR(100),
    PerDirCalleNum    VARCHAR(10),
    PerDirPiso        VARCHAR(3),
    PerDirDpto        VARCHAR(3),
    PerDirParcela     VARCHAR(3),
    PerDirManzana     VARCHAR(3),
    PerDirCasa        VARCHAR(3),
    PerTel            VARCHAR(25),
    PerTelTrabajo     VARCHAR(25),
    PerCel            VARCHAR(25),
    PerFax            VARCHAR(25),
    PerMail           VARCHAR(100),
    EmpCelId          BIGINT          NOT NULL,
    PosFisId          BIGINT          NOT NULL,
    PerCuit           VARCHAR(15),
    OcuId             BIGINT          NOT NULL,
    PerJuridica       INT,
    PRIMARY KEY (PerId)
)ENGINE=INNODB
;



-- 
-- TABLE: PosicionesFiscales 
--

CREATE TABLE PosicionesFiscales(
    PosFisId     BIGINT         NOT NULL,
    PosFisNom    VARCHAR(80)    NOT NULL,
    PRIMARY KEY (PosFisId)
)ENGINE=INNODB
;



-- 
-- TABLE: Provincias 
--

CREATE TABLE Provincias(
    ProvId     BIGINT         NOT NULL,
    PaisId     BIGINT         NOT NULL,
    ProvNom    VARCHAR(80)    NOT NULL,
    PRIMARY KEY (ProvId)
)ENGINE=INNODB
;



-- 
-- TABLE: ResumenesCentrosOperaciones 
--

CREATE TABLE ResumenesCentrosOperaciones(
    ResCenOpId                    BIGINT           NOT NULL,
    UniNegId                      BIGINT           NOT NULL,
    CenOpId                       BIGINT           NOT NULL,
    ResCenOpPeriodoAno            INT              NOT NULL,
    ResCenOpPeriodoMes            INT              NOT NULL,
    ResCenOpFchGeneracion         DATETIME         NOT NULL,
    ResCenOpSaldoInicial          DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCenOpTotalVtas             DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCenOpDescVtas              DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCenOpDescPagoExpress       DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCenOpTotalCobrar           DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCenOpTotalCobros           DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCenOpDescImportesCobros    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCenOpDescCantCobros        DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCenOpTotalDepositar        DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCenOpFchDep                DATETIME,
    ResCenOpImporteDepositado     DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    AsiId                         BIGINT           NOT NULL,
    ResCenOpIdResumenAnterior     BIGINT           DEFAULT 0 NOT NULL,
    ResCenOpIdResumenSiguiente    BIGINT           DEFAULT 0 NOT NULL,
    PRIMARY KEY (ResCenOpId)
)ENGINE=INNODB
;



-- 
-- TABLE: ResumenesCentrosOperacionesDetalle 
--

CREATE TABLE ResumenesCentrosOperacionesDetalle(
    ResCenOpId            BIGINT           NOT NULL,
    ResCenOpDetLinId      BIGINT           NOT NULL,
    AsiId                 BIGINT           NOT NULL,
    ConCarFiId            BIGINT           NOT NULL,
    ResCenOpDetFch        DATETIME         NOT NULL,
    ResCenOpDetImporte    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    PRIMARY KEY (ResCenOpId, ResCenOpDetLinId)
)ENGINE=INNODB
;



-- 
-- TABLE: ResumenesClientes 
--

CREATE TABLE ResumenesClientes(
    ResCliId                         BIGINT           NOT NULL,
    UniNegId                         BIGINT           NOT NULL,
    PerId                            BIGINT           NOT NULL,
    ResCliPeriodoAno                 INT              NOT NULL,
    ResCliPeriodoMes                 INT              NOT NULL,
    ResCliFchGeneracion              DATETIME         NOT NULL,
    ResCliFchVto1                    DATETIME         NOT NULL,
    ResCliFchVto2                    DATETIME         NOT NULL,
    ResCliSaldoAnterior              DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliCargoFinanciacionSaldos    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliImporteCuotasMes           DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliImporteCompFinancMes       DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliCargoEmisionResumen        DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliCargoRenovacionTarjetas    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliCargoExcesoLimiteCompra    DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliInteresesMora              DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliInteresesPunitorios        DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliInteresesPositivos         DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliImportePagar               DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliImporteMinPagar            DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    ResCliFchPago                    DATETIME,
    ResCliImportePagado              DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    AsiId                            BIGINT           NOT NULL,
    ResCliIdResumenAnterior          BIGINT           DEFAULT 0 NOT NULL,
    ResCliIdResumenSiguiente         BIGINT           DEFAULT 0 NOT NULL,
    PRIMARY KEY (ResCliId)
)ENGINE=INNODB
;



-- 
-- TABLE: ResumenesClientesDetalle 
--

CREATE TABLE ResumenesClientesDetalle(
    ResCliId                     BIGINT            NOT NULL,
    ResCliDetLinId               BIGINT            NOT NULL,
    CenOpId                      BIGINT            NOT NULL,
    ConCarFiId                   BIGINT            NOT NULL,
    ResCliDetFch                 DATETIME          NOT NULL,
    ResCliDetCuotaNum            INT               NOT NULL,
    ResCliDetCantCuotas          INT               NOT NULL,
    ResCliDetImporte             DECIMAL(8, 2)     DEFAULT 0 NOT NULL,
    ResCliDetPtosFidelizacion    DECIMAL(10, 2)    NOT NULL,
    PRIMARY KEY (ResCliId, ResCliDetLinId)
)ENGINE=INNODB
;



-- 
-- TABLE: RubrosComerciales 
--

CREATE TABLE RubrosComerciales(
    RubComId     BIGINT         NOT NULL,
    RubComNom    VARCHAR(80)    NOT NULL,
    PRIMARY KEY (RubComId)
)ENGINE=INNODB
;



-- 
-- TABLE: Tarjetas 
--

CREATE TABLE Tarjetas(
    TarId                          BIGINT          NOT NULL,
    TarNum                         VARCHAR(100),
    TarPerId                       BIGINT          NOT NULL,
    TarAsoUniNegId                 BIGINT          NOT NULL,
    TarAsoPerId                    BIGINT          NOT NULL,
    TarFchAlta                     DATETIME        NOT NULL,
    TarFchBaja                     DATETIME,
    TarFchVencimiento              DATETIME,
    TarEstadoImpresion             BIGINT          NOT NULL,
    TarFchCambioEstadoImpresion    DATETIME,
    PRIMARY KEY (TarId)
)ENGINE=INNODB
;



-- 
-- TABLE: TerminalesNegocio 
--

CREATE TABLE TerminalesNegocio(
    TerUniId         BIGINT         NOT NULL,
    UniNegId         BIGINT         NOT NULL,
    TerUniNum        VARCHAR(80)    NOT NULL,
    TerUniFchAlta    DATETIME       NOT NULL,
    TerUniFchBaja    DATETIME,
    TerUniCodAct     VARCHAR(80),
    TerUniIdHw       VARCHAR(80),
    TerUniFchAct     DATETIME,
    TerUniFchIni     DATETIME,
    TerUniFchFin     DATETIME,
    PRIMARY KEY (TerUniId)
)ENGINE=INNODB
;



-- 
-- TABLE: TerminalesOperacion 
--

CREATE TABLE TerminalesOperacion(
    TerOpId                   BIGINT           NOT NULL,
    CenOpId                   BIGINT           NOT NULL,
    TerOpNum                  VARCHAR(80)      NOT NULL,
    TerOpFchAlta              DATETIME         NOT NULL,
    TerOpFchBaja              DATETIME,
    TerOpLimiteCobro          DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    TerOpPlazoLimiteCobro     DECIMAL(4, 1)    NOT NULL,
    TerOpIdPublica            VARCHAR(30),
    TerOpUbicacionArchivos    VARCHAR(256),
    TerOpCodAct               VARCHAR(80),
    TerOpIdHw                 VARCHAR(80),
    TerOpFchAct               DATETIME,
    TerOpFchIni               DATETIME,
    TerOpFchFin               DATETIME,
    PRIMARY KEY (TerOpId)
)ENGINE=INNODB
;



-- 
-- TABLE: TiposAsiento 
--

CREATE TABLE TiposAsiento(
    TipoAsiId     BIGINT         NOT NULL,
    TipoAsiNom    VARCHAR(80)    NOT NULL,
    PRIMARY KEY (TipoAsiId)
)ENGINE=INNODB
;



-- 
-- TABLE: TiposClientes 
--

CREATE TABLE TiposClientes(
    TipoCliId                                   BIGINT           NOT NULL,
    TipoCliNom                                  VARCHAR(80)      NOT NULL,
    UniNegId                                    BIGINT           NOT NULL,
    TipoCliCostoResumenFidelizacion             DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    TipoCliCostoResumenCredito                  DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    TipoCliCostoRenovacionTarjeta               DECIMAL(8, 2)    DEFAULT 0 NOT NULL,
    TipoCliTasaInteresesPositivosAdelantados    DECIMAL(7, 3)    DEFAULT 0 NOT NULL,
    TipoCliTasaFinanciacionSaldos               DECIMAL(7, 3)    DEFAULT 0 NOT NULL,
    TipoCliTasaPagoMin                          DECIMAL(7, 3)    DEFAULT 0 NOT NULL,
    TipoCliTasaPagoAdelantosProm6               DECIMAL(7, 3)    DEFAULT 0 NOT NULL,
    TipoCliRecargoExcLimCompra                  DECIMAL(7, 3)    DEFAULT 0 NOT NULL,
    TipoCliCargoAdelantoEfectivoPrestamos       DECIMAL(7, 3)    DEFAULT 0 NOT NULL,
    PRIMARY KEY (TipoCliId)
)ENGINE=INNODB
;



-- 
-- TABLE: TiposDocumentos 
--

CREATE TABLE TiposDocumentos(
    TipoDocId     BIGINT         NOT NULL,
    TipoDocNom    VARCHAR(80)    NOT NULL,
    PRIMARY KEY (TipoDocId)
)ENGINE=INNODB
;



-- 
-- TABLE: TiposUsuario 
--

CREATE TABLE TiposUsuario(
    TipoUsuId             BIGINT         NOT NULL,
    TipoUsuNom            VARCHAR(80)    NOT NULL,
    TipoUsuEntidadProp    BIGINT         NOT NULL,
    PRIMARY KEY (TipoUsuId)
)ENGINE=INNODB
;



-- 
-- TABLE: UnidadesNegocio 
--

CREATE TABLE UnidadesNegocio(
    UniNegId                             BIGINT           NOT NULL,
    UniNegNom                            VARCHAR(80)      NOT NULL,
    UniNegDirCalle                       VARCHAR(100),
    UniNegDirCalleNum                    VARCHAR(10),
    UniNegDirPiso                        VARCHAR(3),
    UniNegDirDpto                        VARCHAR(3),
    CiuId                                BIGINT           NOT NULL,
    UniNegTel                            VARCHAR(25),
    UniNegFax                            VARCHAR(25),
    UniNegMail                           VARCHAR(100),
    PosFisId                             BIGINT           NOT NULL,
    UniNegCuit                           VARCHAR(15),
    UniNegFchAlta                        DATETIME         NOT NULL,
    UniNegFchBaja                        DATETIME,
    UniNegRelacionPesoPunto              DECIMAL(7, 2)    NOT NULL,
    UniNegValorDescPtos                  DECIMAL(7, 2)    NOT NULL,
    UniNegIdPublica                      VARCHAR(30),
    UniNegUbicacionArchivoLiquidacion    VARCHAR(256),
    UniNegDiaCorteLiquidacion            INT              DEFAULT 0 NOT NULL,
    PRIMARY KEY (UniNegId)
)ENGINE=INNODB
;



-- 
-- TABLE: Usuarios 
--

CREATE TABLE Usuarios(
    UsuId         BIGINT         NOT NULL,
    UsuNom        VARCHAR(80)    NOT NULL,
    UsuPass       VARCHAR(80)    NOT NULL,
    TipoUsuId     BIGINT         NOT NULL,
    UsuFchAlta    DATETIME       NOT NULL,
    UsuFchBaja    DATETIME,
    UniNegId      BIGINT         NOT NULL,
    CenOpId       BIGINT         NOT NULL,
    PRIMARY KEY (UsuId)
)ENGINE=INNODB
;



-- 
-- TABLE: UsuariosWeb 
--

CREATE TABLE UsuariosWeb(
    TarId                  BIGINT         NOT NULL,
    UsuWebNom              VARCHAR(80)    NOT NULL,
    UsuWebPass             VARCHAR(80)    NOT NULL,
    UsuWebFchAlta          DATETIME       NOT NULL,
    UsuWebFchBaja          DATETIME,
    UsuWebCodIniciacion    VARCHAR(30),
    PRIMARY KEY (TarId)
)ENGINE=INNODB
;



-- 
-- TABLE: Asientos 
--

ALTER TABLE Asientos ADD CONSTRAINT RefTarjetas30 
    FOREIGN KEY (TarId)
    REFERENCES Tarjetas(TarId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Asientos ADD CONSTRAINT RefTiposAsiento34 
    FOREIGN KEY (TipoAsiId)
    REFERENCES TiposAsiento(TipoAsiId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE Asientos ADD CONSTRAINT RefTerminalesOperacion37 
    FOREIGN KEY (TerOpId)
    REFERENCES TerminalesOperacion(TerOpId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE Asientos ADD CONSTRAINT RefUnidadesNegocio43 
    FOREIGN KEY (UniNegId)
    REFERENCES UnidadesNegocio(UniNegId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE Asientos ADD CONSTRAINT RefConveniosCentrosOperaciones79 
    FOREIGN KEY (ConCenOpId)
    REFERENCES ConveniosCentrosOperaciones(ConCenOpId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: AsignacionFuncionesTerminalesOperacion 
--

ALTER TABLE AsignacionFuncionesTerminalesOperacion ADD CONSTRAINT RefTerminalesOperacion39 
    FOREIGN KEY (TerOpId)
    REFERENCES TerminalesOperacion(TerOpId) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE AsignacionFuncionesTerminalesOperacion ADD CONSTRAINT RefFuncionesTerminalesOperacion40 
    FOREIGN KEY (FunTerOpId)
    REFERENCES FuncionesTerminalesOperacion(FunTerOpId) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: AsociacionesUnidadNegocio 
--

ALTER TABLE AsociacionesUnidadNegocio ADD CONSTRAINT RefUnidadesNegocio17 
    FOREIGN KEY (UniNegId)
    REFERENCES UnidadesNegocio(UniNegId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE AsociacionesUnidadNegocio ADD CONSTRAINT RefPersonas18 
    FOREIGN KEY (PerId)
    REFERENCES Personas(PerId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE AsociacionesUnidadNegocio ADD CONSTRAINT RefTiposClientes24 
    FOREIGN KEY (TipoCliId)
    REFERENCES TiposClientes(TipoCliId) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: Barrios 
--

ALTER TABLE Barrios ADD CONSTRAINT RefCiudades89 
    FOREIGN KEY (CiuId)
    REFERENCES Ciudades(CiuId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: CentrosOperaciones 
--

ALTER TABLE CentrosOperaciones ADD CONSTRAINT RefCiudades11 
    FOREIGN KEY (CiuId)
    REFERENCES Ciudades(CiuId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE CentrosOperaciones ADD CONSTRAINT RefPosicionesFiscales20 
    FOREIGN KEY (PosFisId)
    REFERENCES PosicionesFiscales(PosFisId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE CentrosOperaciones ADD CONSTRAINT RefRubrosComerciales75 
    FOREIGN KEY (RubComId)
    REFERENCES RubrosComerciales(RubComId) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: Ciudades 
--

ALTER TABLE Ciudades ADD CONSTRAINT RefProvincias10 
    FOREIGN KEY (ProvId)
    REFERENCES Provincias(ProvId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: ConceptosCargosFijos 
--

ALTER TABLE ConceptosCargosFijos ADD CONSTRAINT RefUnidadesNegocio49 
    FOREIGN KEY (UniNegId)
    REFERENCES UnidadesNegocio(UniNegId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: ConceptosDebitadosAutomaticamente 
--

ALTER TABLE ConceptosDebitadosAutomaticamente ADD CONSTRAINT RefConceptosCargosFijos50 
    FOREIGN KEY (ConCarFiId)
    REFERENCES ConceptosCargosFijos(ConCarFiId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ConceptosDebitadosAutomaticamente ADD CONSTRAINT RefTarjetas51 
    FOREIGN KEY (TarId)
    REFERENCES Tarjetas(TarId) ON DELETE CASCADE ON UPDATE CASCADE
;


-- 
-- TABLE: ConveniosCentrosOperaciones 
--

ALTER TABLE ConveniosCentrosOperaciones ADD CONSTRAINT RefUnidadesNegocio22 
    FOREIGN KEY (UniNegId)
    REFERENCES UnidadesNegocio(UniNegId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ConveniosCentrosOperaciones ADD CONSTRAINT RefCentrosOperaciones23 
    FOREIGN KEY (CenOpId)
    REFERENCES CentrosOperaciones(CenOpId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: CuentasAsiento 
--

ALTER TABLE CuentasAsiento ADD CONSTRAINT RefAsientos32 
    FOREIGN KEY (AsiId)
    REFERENCES Asientos(AsiId) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE CuentasAsiento ADD CONSTRAINT RefCuentasContabilidad33 
    FOREIGN KEY (CtaContId)
    REFERENCES CuentasContabilidad(CtaContId) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: CuotasCompras 
--

ALTER TABLE CuotasCompras ADD CONSTRAINT RefAsientos44 
    FOREIGN KEY (AsiId)
    REFERENCES Asientos(AsiId) ON DELETE CASCADE ON UPDATE CASCADE
;


-- 
-- TABLE: DispositivosEntrada 
--

ALTER TABLE DispositivosEntrada ADD CONSTRAINT RefUnidadesNegocio73 
    FOREIGN KEY (UniNegId)
    REFERENCES UnidadesNegocio(UniNegId)
;

ALTER TABLE DispositivosEntrada ADD CONSTRAINT RefTerminalesOperacion74 
    FOREIGN KEY (TerOpId)
    REFERENCES TerminalesOperacion(TerOpId)
;


-- 
-- TABLE: FuncionesSistemaTipoUsuario 
--

ALTER TABLE FuncionesSistemaTipoUsuario ADD CONSTRAINT RefFuncionesSistema14 
    FOREIGN KEY (FunSisId)
    REFERENCES FuncionesSistema(FunSisId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE FuncionesSistemaTipoUsuario ADD CONSTRAINT RefTiposUsuario15 
    FOREIGN KEY (TipoUsuId)
    REFERENCES TiposUsuario(TipoUsuId) ON DELETE CASCADE ON UPDATE CASCADE
;


-- 
-- TABLE: LiquidacionesCenOp 
--

ALTER TABLE LiquidacionesCenOp ADD CONSTRAINT RefAsientos86 
    FOREIGN KEY (LiqCenOpAsientoLiqCarga)
    REFERENCES Asientos(AsiId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE LiquidacionesCenOp ADD CONSTRAINT RefAsientos88 
    FOREIGN KEY (LiqCenOpAsiLiqDescarga)
    REFERENCES Asientos(AsiId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: LiquidacionesCenOpConvenios 
--

ALTER TABLE LiquidacionesCenOpConvenios ADD CONSTRAINT RefLiquidacionesCenOp84 
    FOREIGN KEY (LiqCenOpId)
    REFERENCES LiquidacionesCenOp(LiqCenOpId) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE LiquidacionesCenOpConvenios ADD CONSTRAINT RefConveniosCentrosOperaciones85 
    FOREIGN KEY (ConCenOpId)
    REFERENCES ConveniosCentrosOperaciones(ConCenOpId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: ParametrosCliente 
--

ALTER TABLE ParametrosCliente ADD CONSTRAINT RefRubrosComerciales65 
    FOREIGN KEY (RubComId)
    REFERENCES RubrosComerciales(RubComId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ParametrosCliente ADD CONSTRAINT RefAsociacionesUnidadNegocio68 
    FOREIGN KEY (UniNegId, PerId)
    REFERENCES AsociacionesUnidadNegocio(UniNegId, PerId) ON DELETE CASCADE ON UPDATE CASCADE
;


-- 
-- TABLE: ParametrosTipoCliente 
--

ALTER TABLE ParametrosTipoCliente ADD CONSTRAINT RefRubrosComerciales69 
    FOREIGN KEY (RubComId)
    REFERENCES RubrosComerciales(RubComId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ParametrosTipoCliente ADD CONSTRAINT RefTiposClientes70 
    FOREIGN KEY (TipoCliId)
    REFERENCES TiposClientes(TipoCliId) ON DELETE CASCADE ON UPDATE RESTRICT
;


-- 
-- TABLE: ParametrosUnidadNegocio 
--

ALTER TABLE ParametrosUnidadNegocio ADD CONSTRAINT RefUnidadesNegocio77 
    FOREIGN KEY (UniNegId)
    REFERENCES UnidadesNegocio(UniNegId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ParametrosUnidadNegocio ADD CONSTRAINT RefCentrosOperaciones78 
    FOREIGN KEY (CenOpId)
    REFERENCES CentrosOperaciones(CenOpId) ON DELETE CASCADE ON UPDATE CASCADE
;


-- 
-- TABLE: Personas 
--

ALTER TABLE Personas ADD CONSTRAINT RefTiposDocumentos1 
    FOREIGN KEY (TipoDocId)
    REFERENCES TiposDocumentos(TipoDocId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Personas ADD CONSTRAINT RefPosicionesFiscales19 
    FOREIGN KEY (PosFisId)
    REFERENCES PosicionesFiscales(PosFisId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE Personas ADD CONSTRAINT RefEmpresasCelular58 
    FOREIGN KEY (EmpCelId)
    REFERENCES EmpresasCelular(EmpCelId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Personas ADD CONSTRAINT RefOcupacion76 
    FOREIGN KEY (OcuId)
    REFERENCES Ocupacion(OcuId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Personas ADD CONSTRAINT RefBarrios90 
    FOREIGN KEY (BarId)
    REFERENCES Barrios(BarId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE Personas ADD CONSTRAINT RefCiudades92 
    FOREIGN KEY (CiuId)
    REFERENCES Ciudades(CiuId) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: Provincias 
--

ALTER TABLE Provincias ADD CONSTRAINT RefPaises9 
    FOREIGN KEY (PaisId)
    REFERENCES Paises(PaisId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: ResumenesCentrosOperaciones 
--

ALTER TABLE ResumenesCentrosOperaciones ADD CONSTRAINT RefParametrosUnidadNegocio95 
    FOREIGN KEY (UniNegId, CenOpId)
    REFERENCES ParametrosUnidadNegocio(UniNegId, CenOpId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE ResumenesCentrosOperaciones ADD CONSTRAINT RefAsientos96 
    FOREIGN KEY (AsiId)
    REFERENCES Asientos(AsiId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: ResumenesCentrosOperacionesDetalle 
--

ALTER TABLE ResumenesCentrosOperacionesDetalle ADD CONSTRAINT RefResumenesCentrosOperaciones54 
    FOREIGN KEY (ResCenOpId)
    REFERENCES ResumenesCentrosOperaciones(ResCenOpId) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE ResumenesCentrosOperacionesDetalle ADD CONSTRAINT RefConceptosCargosFijos56 
    FOREIGN KEY (ConCarFiId)
    REFERENCES ConceptosCargosFijos(ConCarFiId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE ResumenesCentrosOperacionesDetalle ADD CONSTRAINT RefAsientos97 
    FOREIGN KEY (AsiId)
    REFERENCES Asientos(AsiId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: ResumenesClientes 
--

ALTER TABLE ResumenesClientes ADD CONSTRAINT RefAsociacionesUnidadNegocio47 
    FOREIGN KEY (UniNegId, PerId)
    REFERENCES AsociacionesUnidadNegocio(UniNegId, PerId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE ResumenesClientes ADD CONSTRAINT RefAsientos93 
    FOREIGN KEY (AsiId)
    REFERENCES Asientos(AsiId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: ResumenesClientesDetalle 
--

ALTER TABLE ResumenesClientesDetalle ADD CONSTRAINT RefResumenesClientes45 
    FOREIGN KEY (ResCliId)
    REFERENCES ResumenesClientes(ResCliId) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE ResumenesClientesDetalle ADD CONSTRAINT RefCentrosOperaciones48 
    FOREIGN KEY (CenOpId)
    REFERENCES CentrosOperaciones(CenOpId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE ResumenesClientesDetalle ADD CONSTRAINT RefConceptosCargosFijos52 
    FOREIGN KEY (ConCarFiId)
    REFERENCES ConceptosCargosFijos(ConCarFiId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: Tarjetas 
--

ALTER TABLE Tarjetas ADD CONSTRAINT RefPersonas29 
    FOREIGN KEY (TarPerId)
    REFERENCES Personas(PerId) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Tarjetas ADD CONSTRAINT RefAsociacionesUnidadNegocio31 
    FOREIGN KEY (TarAsoUniNegId, TarAsoPerId)
    REFERENCES AsociacionesUnidadNegocio(UniNegId, PerId) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: TerminalesNegocio 
--

ALTER TABLE TerminalesNegocio ADD CONSTRAINT RefUnidadesNegocio81 
    FOREIGN KEY (UniNegId)
    REFERENCES UnidadesNegocio(UniNegId) ON DELETE CASCADE ON UPDATE CASCADE
;


-- 
-- TABLE: TerminalesOperacion 
--

ALTER TABLE TerminalesOperacion ADD CONSTRAINT RefCentrosOperaciones36 
    FOREIGN KEY (CenOpId)
    REFERENCES CentrosOperaciones(CenOpId) ON DELETE CASCADE ON UPDATE CASCADE
;


-- 
-- TABLE: TiposClientes 
--

ALTER TABLE TiposClientes ADD CONSTRAINT RefUnidadesNegocio16 
    FOREIGN KEY (UniNegId)
    REFERENCES UnidadesNegocio(UniNegId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: UnidadesNegocio 
--

ALTER TABLE UnidadesNegocio ADD CONSTRAINT RefPosicionesFiscales21 
    FOREIGN KEY (PosFisId)
    REFERENCES PosicionesFiscales(PosFisId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE UnidadesNegocio ADD CONSTRAINT RefCiudades59 
    FOREIGN KEY (CiuId)
    REFERENCES Ciudades(CiuId) ON DELETE RESTRICT ON UPDATE CASCADE
;


-- 
-- TABLE: Usuarios 
--

ALTER TABLE Usuarios ADD CONSTRAINT RefTiposUsuario13 
    FOREIGN KEY (TipoUsuId)
    REFERENCES TiposUsuario(TipoUsuId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE Usuarios ADD CONSTRAINT RefUnidadesNegocio62 
    FOREIGN KEY (UniNegId)
    REFERENCES UnidadesNegocio(UniNegId) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE Usuarios ADD CONSTRAINT RefCentrosOperaciones72 
    FOREIGN KEY (CenOpId)
    REFERENCES CentrosOperaciones(CenOpId) ON DELETE CASCADE ON UPDATE CASCADE
;


-- 
-- TABLE: UsuariosWeb 
--

ALTER TABLE UsuariosWeb ADD CONSTRAINT RefTarjetas80 
    FOREIGN KEY (TarId)
    REFERENCES Tarjetas(TarId) ON DELETE CASCADE ON UPDATE CASCADE
;


