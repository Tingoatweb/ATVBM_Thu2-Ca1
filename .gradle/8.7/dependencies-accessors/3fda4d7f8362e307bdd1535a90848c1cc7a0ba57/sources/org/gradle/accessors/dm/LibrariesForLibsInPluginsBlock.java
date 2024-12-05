package org.gradle.accessors.dm;

import org.gradle.api.NonNullApi;
import org.gradle.api.artifacts.MinimalExternalModuleDependency;
import org.gradle.plugin.use.PluginDependency;
import org.gradle.api.artifacts.ExternalModuleDependencyBundle;
import org.gradle.api.artifacts.MutableVersionConstraint;
import org.gradle.api.provider.Provider;
import org.gradle.api.model.ObjectFactory;
import org.gradle.api.provider.ProviderFactory;
import org.gradle.api.internal.catalog.AbstractExternalDependencyFactory;
import org.gradle.api.internal.catalog.DefaultVersionCatalog;
import java.util.Map;
import org.gradle.api.internal.attributes.ImmutableAttributesFactory;
import org.gradle.api.internal.artifacts.dsl.CapabilityNotationParser;
import javax.inject.Inject;

/**
 * A catalog of dependencies accessible via the {@code libs} extension.
 */
@NonNullApi
public class LibrariesForLibsInPluginsBlock extends AbstractExternalDependencyFactory {

    private final AbstractExternalDependencyFactory owner = this;
    private final ComLibraryAccessors laccForComLibraryAccessors = new ComLibraryAccessors(owner);
    private final JavaxLibraryAccessors laccForJavaxLibraryAccessors = new JavaxLibraryAccessors(owner);
    private final JunitLibraryAccessors laccForJunitLibraryAccessors = new JunitLibraryAccessors(owner);
    private final MysqlLibraryAccessors laccForMysqlLibraryAccessors = new MysqlLibraryAccessors(owner);
    private final OrgLibraryAccessors laccForOrgLibraryAccessors = new OrgLibraryAccessors(owner);
    private final TaglibsLibraryAccessors laccForTaglibsLibraryAccessors = new TaglibsLibraryAccessors(owner);
    private final VersionAccessors vaccForVersionAccessors = new VersionAccessors(providers, config);
    private final BundleAccessors baccForBundleAccessors = new BundleAccessors(objects, providers, config, attributesFactory, capabilityNotationParser);
    private final PluginAccessors paccForPluginAccessors = new PluginAccessors(providers, config);

    @Inject
    public LibrariesForLibsInPluginsBlock(DefaultVersionCatalog config, ProviderFactory providers, ObjectFactory objects, ImmutableAttributesFactory attributesFactory, CapabilityNotationParser capabilityNotationParser) {
        super(config, providers, objects, attributesFactory, capabilityNotationParser);
    }

    /**
     * Group of libraries at <b>com</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public ComLibraryAccessors getCom() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return laccForComLibraryAccessors;
    }

    /**
     * Group of libraries at <b>javax</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public JavaxLibraryAccessors getJavax() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return laccForJavaxLibraryAccessors;
    }

    /**
     * Group of libraries at <b>junit</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public JunitLibraryAccessors getJunit() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return laccForJunitLibraryAccessors;
    }

    /**
     * Group of libraries at <b>mysql</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public MysqlLibraryAccessors getMysql() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return laccForMysqlLibraryAccessors;
    }

    /**
     * Group of libraries at <b>org</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public OrgLibraryAccessors getOrg() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return laccForOrgLibraryAccessors;
    }

    /**
     * Group of libraries at <b>taglibs</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public TaglibsLibraryAccessors getTaglibs() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return laccForTaglibsLibraryAccessors;
    }

    /**
     * Group of versions at <b>versions</b>
     */
    public VersionAccessors getVersions() {
        return vaccForVersionAccessors;
    }

    /**
     * Group of bundles at <b>bundles</b>
     *
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public BundleAccessors getBundles() {
        org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
        return baccForBundleAccessors;
    }

    /**
     * Group of plugins at <b>plugins</b>
     */
    public PluginAccessors getPlugins() {
        return paccForPluginAccessors;
    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComLibraryAccessors extends SubDependencyFactory {
        private final ComGoogleLibraryAccessors laccForComGoogleLibraryAccessors = new ComGoogleLibraryAccessors(owner);
        private final ComIp2locationLibraryAccessors laccForComIp2locationLibraryAccessors = new ComIp2locationLibraryAccessors(owner);
        private final ComSunLibraryAccessors laccForComSunLibraryAccessors = new ComSunLibraryAccessors(owner);

        public ComLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.google</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComGoogleLibraryAccessors getGoogle() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComGoogleLibraryAccessors;
        }

        /**
         * Group of libraries at <b>com.ip2location</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComIp2locationLibraryAccessors getIp2location() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComIp2locationLibraryAccessors;
        }

        /**
         * Group of libraries at <b>com.sun</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComSunLibraryAccessors getSun() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComSunLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComGoogleLibraryAccessors extends SubDependencyFactory {
        private final ComGoogleCodeLibraryAccessors laccForComGoogleCodeLibraryAccessors = new ComGoogleCodeLibraryAccessors(owner);

        public ComGoogleLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.google.code</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComGoogleCodeLibraryAccessors getCode() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComGoogleCodeLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComGoogleCodeLibraryAccessors extends SubDependencyFactory {
        private final ComGoogleCodeGsonLibraryAccessors laccForComGoogleCodeGsonLibraryAccessors = new ComGoogleCodeGsonLibraryAccessors(owner);

        public ComGoogleCodeLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.google.code.gson</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComGoogleCodeGsonLibraryAccessors getGson() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComGoogleCodeGsonLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComGoogleCodeGsonLibraryAccessors extends SubDependencyFactory {

        public ComGoogleCodeGsonLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>gson</b> with <b>com.google.code.gson:gson</b> coordinates and
         * with version reference <b>com.google.code.gson.gson</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getGson() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("com.google.code.gson.gson");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComIp2locationLibraryAccessors extends SubDependencyFactory {
        private final ComIp2locationIp2locationLibraryAccessors laccForComIp2locationIp2locationLibraryAccessors = new ComIp2locationIp2locationLibraryAccessors(owner);

        public ComIp2locationLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.ip2location.ip2location</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComIp2locationIp2locationLibraryAccessors getIp2location() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComIp2locationIp2locationLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComIp2locationIp2locationLibraryAccessors extends SubDependencyFactory {
        private final ComIp2locationIp2locationIoLibraryAccessors laccForComIp2locationIp2locationIoLibraryAccessors = new ComIp2locationIp2locationIoLibraryAccessors(owner);

        public ComIp2locationIp2locationLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>java</b> with <b>com.ip2location:ip2location-java</b> coordinates and
         * with version reference <b>com.ip2location.ip2location.java</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getJava() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("com.ip2location.ip2location.java");
        }

        /**
         * Group of libraries at <b>com.ip2location.ip2location.io</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComIp2locationIp2locationIoLibraryAccessors getIo() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComIp2locationIp2locationIoLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComIp2locationIp2locationIoLibraryAccessors extends SubDependencyFactory {

        public ComIp2locationIp2locationIoLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>java</b> with <b>com.ip2location:ip2location-io-java</b> coordinates and
         * with version reference <b>com.ip2location.ip2location.io.java</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getJava() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("com.ip2location.ip2location.io.java");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComSunLibraryAccessors extends SubDependencyFactory {
        private final ComSunMailLibraryAccessors laccForComSunMailLibraryAccessors = new ComSunMailLibraryAccessors(owner);

        public ComSunLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.sun.mail</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComSunMailLibraryAccessors getMail() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComSunMailLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComSunMailLibraryAccessors extends SubDependencyFactory {
        private final ComSunMailJavaxLibraryAccessors laccForComSunMailJavaxLibraryAccessors = new ComSunMailJavaxLibraryAccessors(owner);

        public ComSunMailLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>com.sun.mail.javax</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public ComSunMailJavaxLibraryAccessors getJavax() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForComSunMailJavaxLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class ComSunMailJavaxLibraryAccessors extends SubDependencyFactory {

        public ComSunMailJavaxLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>mail</b> with <b>com.sun.mail:javax.mail</b> coordinates and
         * with version reference <b>com.sun.mail.javax.mail</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getMail() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("com.sun.mail.javax.mail");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxLibraryAccessors extends SubDependencyFactory {
        private final JavaxServletLibraryAccessors laccForJavaxServletLibraryAccessors = new JavaxServletLibraryAccessors(owner);

        public JavaxLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>javax.servlet</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JavaxServletLibraryAccessors getServlet() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJavaxServletLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxServletLibraryAccessors extends SubDependencyFactory {
        private final JavaxServletJavaxLibraryAccessors laccForJavaxServletJavaxLibraryAccessors = new JavaxServletJavaxLibraryAccessors(owner);
        private final JavaxServletJspLibraryAccessors laccForJavaxServletJspLibraryAccessors = new JavaxServletJspLibraryAccessors(owner);

        public JavaxServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>javax.servlet.javax</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JavaxServletJavaxLibraryAccessors getJavax() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJavaxServletJavaxLibraryAccessors;
        }

        /**
         * Group of libraries at <b>javax.servlet.jsp</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JavaxServletJspLibraryAccessors getJsp() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJavaxServletJspLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxServletJavaxLibraryAccessors extends SubDependencyFactory {
        private final JavaxServletJavaxServletLibraryAccessors laccForJavaxServletJavaxServletLibraryAccessors = new JavaxServletJavaxServletLibraryAccessors(owner);

        public JavaxServletJavaxLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>javax.servlet.javax.servlet</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JavaxServletJavaxServletLibraryAccessors getServlet() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJavaxServletJavaxServletLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxServletJavaxServletLibraryAccessors extends SubDependencyFactory {

        public JavaxServletJavaxServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>javax.servlet:javax.servlet-api</b> coordinates and
         * with version reference <b>javax.servlet.javax.servlet.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getApi() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("javax.servlet.javax.servlet.api");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxServletJspLibraryAccessors extends SubDependencyFactory {
        private final JavaxServletJspJstlLibraryAccessors laccForJavaxServletJspJstlLibraryAccessors = new JavaxServletJspJstlLibraryAccessors(owner);

        public JavaxServletJspLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>javax.servlet.jsp.jstl</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JavaxServletJspJstlLibraryAccessors getJstl() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJavaxServletJspJstlLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxServletJspJstlLibraryAccessors extends SubDependencyFactory {
        private final JavaxServletJspJstlJavaxLibraryAccessors laccForJavaxServletJspJstlJavaxLibraryAccessors = new JavaxServletJspJstlJavaxLibraryAccessors(owner);
        private final JavaxServletJspJstlJstlLibraryAccessors laccForJavaxServletJspJstlJstlLibraryAccessors = new JavaxServletJspJstlJstlLibraryAccessors(owner);

        public JavaxServletJspJstlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>javax.servlet.jsp.jstl.javax</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JavaxServletJspJstlJavaxLibraryAccessors getJavax() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJavaxServletJspJstlJavaxLibraryAccessors;
        }

        /**
         * Group of libraries at <b>javax.servlet.jsp.jstl.jstl</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JavaxServletJspJstlJstlLibraryAccessors getJstl() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJavaxServletJspJstlJstlLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxServletJspJstlJavaxLibraryAccessors extends SubDependencyFactory {
        private final JavaxServletJspJstlJavaxServletLibraryAccessors laccForJavaxServletJspJstlJavaxServletLibraryAccessors = new JavaxServletJspJstlJavaxServletLibraryAccessors(owner);

        public JavaxServletJspJstlJavaxLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>javax.servlet.jsp.jstl.javax.servlet</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JavaxServletJspJstlJavaxServletLibraryAccessors getServlet() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJavaxServletJspJstlJavaxServletLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxServletJspJstlJavaxServletLibraryAccessors extends SubDependencyFactory {
        private final JavaxServletJspJstlJavaxServletJspLibraryAccessors laccForJavaxServletJspJstlJavaxServletJspLibraryAccessors = new JavaxServletJspJstlJavaxServletJspLibraryAccessors(owner);

        public JavaxServletJspJstlJavaxServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>javax.servlet.jsp.jstl.javax.servlet.jsp</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JavaxServletJspJstlJavaxServletJspLibraryAccessors getJsp() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJavaxServletJspJstlJavaxServletJspLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxServletJspJstlJavaxServletJspLibraryAccessors extends SubDependencyFactory {
        private final JavaxServletJspJstlJavaxServletJspJstlLibraryAccessors laccForJavaxServletJspJstlJavaxServletJspJstlLibraryAccessors = new JavaxServletJspJstlJavaxServletJspJstlLibraryAccessors(owner);

        public JavaxServletJspJstlJavaxServletJspLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>javax.servlet.jsp.jstl.javax.servlet.jsp.jstl</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public JavaxServletJspJstlJavaxServletJspJstlLibraryAccessors getJstl() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForJavaxServletJspJstlJavaxServletJspJstlLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxServletJspJstlJavaxServletJspJstlLibraryAccessors extends SubDependencyFactory {

        public JavaxServletJspJstlJavaxServletJspJstlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>javax.servlet.jsp.jstl:javax.servlet.jsp.jstl-api</b> coordinates and
         * with version reference <b>javax.servlet.jsp.jstl.javax.servlet.jsp.jstl.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getApi() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("javax.servlet.jsp.jstl.javax.servlet.jsp.jstl.api");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JavaxServletJspJstlJstlLibraryAccessors extends SubDependencyFactory {

        public JavaxServletJspJstlJstlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>api</b> with <b>javax.servlet.jsp.jstl:jstl-api</b> coordinates and
         * with version reference <b>javax.servlet.jsp.jstl.jstl.api</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getApi() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("javax.servlet.jsp.jstl.jstl.api");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class JunitLibraryAccessors extends SubDependencyFactory {

        public JunitLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>junit</b> with <b>junit:junit</b> coordinates and
         * with version reference <b>junit.junit</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getJunit() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("junit.junit");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class MysqlLibraryAccessors extends SubDependencyFactory {
        private final MysqlMysqlLibraryAccessors laccForMysqlMysqlLibraryAccessors = new MysqlMysqlLibraryAccessors(owner);

        public MysqlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>mysql.mysql</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public MysqlMysqlLibraryAccessors getMysql() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForMysqlMysqlLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class MysqlMysqlLibraryAccessors extends SubDependencyFactory {
        private final MysqlMysqlConnectorLibraryAccessors laccForMysqlMysqlConnectorLibraryAccessors = new MysqlMysqlConnectorLibraryAccessors(owner);

        public MysqlMysqlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>mysql.mysql.connector</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public MysqlMysqlConnectorLibraryAccessors getConnector() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForMysqlMysqlConnectorLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class MysqlMysqlConnectorLibraryAccessors extends SubDependencyFactory {

        public MysqlMysqlConnectorLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>java</b> with <b>mysql:mysql-connector-java</b> coordinates and
         * with version reference <b>mysql.mysql.connector.java</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getJava() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("mysql.mysql.connector.java");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheLibraryAccessors laccForOrgApacheLibraryAccessors = new OrgApacheLibraryAccessors(owner);
        private final OrgJavafxdataLibraryAccessors laccForOrgJavafxdataLibraryAccessors = new OrgJavafxdataLibraryAccessors(owner);

        public OrgLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.apache</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgApacheLibraryAccessors getApache() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgApacheLibraryAccessors;
        }

        /**
         * Group of libraries at <b>org.javafxdata</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgJavafxdataLibraryAccessors getJavafxdata() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgJavafxdataLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgApacheLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheTaglibsLibraryAccessors laccForOrgApacheTaglibsLibraryAccessors = new OrgApacheTaglibsLibraryAccessors(owner);
        private final OrgApacheTomcatLibraryAccessors laccForOrgApacheTomcatLibraryAccessors = new OrgApacheTomcatLibraryAccessors(owner);

        public OrgApacheLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.apache.taglibs</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgApacheTaglibsLibraryAccessors getTaglibs() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgApacheTaglibsLibraryAccessors;
        }

        /**
         * Group of libraries at <b>org.apache.tomcat</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgApacheTomcatLibraryAccessors getTomcat() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgApacheTomcatLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgApacheTaglibsLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheTaglibsTaglibsLibraryAccessors laccForOrgApacheTaglibsTaglibsLibraryAccessors = new OrgApacheTaglibsTaglibsLibraryAccessors(owner);

        public OrgApacheTaglibsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.apache.taglibs.taglibs</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgApacheTaglibsTaglibsLibraryAccessors getTaglibs() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgApacheTaglibsTaglibsLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgApacheTaglibsTaglibsLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheTaglibsTaglibsStandardLibraryAccessors laccForOrgApacheTaglibsTaglibsStandardLibraryAccessors = new OrgApacheTaglibsTaglibsStandardLibraryAccessors(owner);

        public OrgApacheTaglibsTaglibsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.apache.taglibs.taglibs.standard</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgApacheTaglibsTaglibsStandardLibraryAccessors getStandard() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgApacheTaglibsTaglibsStandardLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgApacheTaglibsTaglibsStandardLibraryAccessors extends SubDependencyFactory {

        public OrgApacheTaglibsTaglibsStandardLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>impl</b> with <b>org.apache.taglibs:taglibs-standard-impl</b> coordinates and
         * with version reference <b>org.apache.taglibs.taglibs.standard.impl</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getImpl() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("org.apache.taglibs.taglibs.standard.impl");
        }

        /**
         * Dependency provider for <b>jstlel</b> with <b>org.apache.taglibs:taglibs-standard-jstlel</b> coordinates and
         * with version reference <b>org.apache.taglibs.taglibs.standard.jstlel</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getJstlel() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("org.apache.taglibs.taglibs.standard.jstlel");
        }

        /**
         * Dependency provider for <b>spec</b> with <b>org.apache.taglibs:taglibs-standard-spec</b> coordinates and
         * with version reference <b>org.apache.taglibs.taglibs.standard.spec</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getSpec() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("org.apache.taglibs.taglibs.standard.spec");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgApacheTomcatLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheTomcatTomcatLibraryAccessors laccForOrgApacheTomcatTomcatLibraryAccessors = new OrgApacheTomcatTomcatLibraryAccessors(owner);

        public OrgApacheTomcatLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.apache.tomcat.tomcat</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgApacheTomcatTomcatLibraryAccessors getTomcat() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgApacheTomcatTomcatLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgApacheTomcatTomcatLibraryAccessors extends SubDependencyFactory {

        public OrgApacheTomcatTomcatLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>util</b> with <b>org.apache.tomcat:tomcat-util</b> coordinates and
         * with version reference <b>org.apache.tomcat.tomcat.util</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getUtil() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("org.apache.tomcat.tomcat.util");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgJavafxdataLibraryAccessors extends SubDependencyFactory {
        private final OrgJavafxdataDatafxLibraryAccessors laccForOrgJavafxdataDatafxLibraryAccessors = new OrgJavafxdataDatafxLibraryAccessors(owner);

        public OrgJavafxdataLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Group of libraries at <b>org.javafxdata.datafx</b>
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public OrgJavafxdataDatafxLibraryAccessors getDatafx() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return laccForOrgJavafxdataDatafxLibraryAccessors;
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class OrgJavafxdataDatafxLibraryAccessors extends SubDependencyFactory {

        public OrgJavafxdataDatafxLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>datareader</b> with <b>org.javafxdata:datafx-datareader</b> coordinates and
         * with version reference <b>org.javafxdata.datafx.datareader</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getDatareader() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("org.javafxdata.datafx.datareader");
        }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class TaglibsLibraryAccessors extends SubDependencyFactory {

        public TaglibsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Dependency provider for <b>standard</b> with <b>taglibs:standard</b> coordinates and
         * with version reference <b>taglibs.standard</b>
         * <p>
         * This dependency was declared in catalog libs.versions.toml
         *
         * @deprecated Will be removed in Gradle 9.0.
         */
        @Deprecated
        public Provider<MinimalExternalModuleDependency> getStandard() {
            org.gradle.internal.deprecation.DeprecationLogger.deprecateBehaviour("Accessing libraries or bundles from version catalogs in the plugins block.").withAdvice("Only use versions or plugins from catalogs in the plugins block.").willBeRemovedInGradle9().withUpgradeGuideSection(8, "kotlin_dsl_deprecated_catalogs_plugins_block").nagUser();
            return create("taglibs.standard");
        }

    }

    public static class VersionAccessors extends VersionFactory  {

        private final ComVersionAccessors vaccForComVersionAccessors = new ComVersionAccessors(providers, config);
        private final JavaxVersionAccessors vaccForJavaxVersionAccessors = new JavaxVersionAccessors(providers, config);
        private final JunitVersionAccessors vaccForJunitVersionAccessors = new JunitVersionAccessors(providers, config);
        private final MysqlVersionAccessors vaccForMysqlVersionAccessors = new MysqlVersionAccessors(providers, config);
        private final OrgVersionAccessors vaccForOrgVersionAccessors = new OrgVersionAccessors(providers, config);
        private final TaglibsVersionAccessors vaccForTaglibsVersionAccessors = new TaglibsVersionAccessors(providers, config);
        public VersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com</b>
         */
        public ComVersionAccessors getCom() {
            return vaccForComVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.javax</b>
         */
        public JavaxVersionAccessors getJavax() {
            return vaccForJavaxVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.junit</b>
         */
        public JunitVersionAccessors getJunit() {
            return vaccForJunitVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.mysql</b>
         */
        public MysqlVersionAccessors getMysql() {
            return vaccForMysqlVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.org</b>
         */
        public OrgVersionAccessors getOrg() {
            return vaccForOrgVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.taglibs</b>
         */
        public TaglibsVersionAccessors getTaglibs() {
            return vaccForTaglibsVersionAccessors;
        }

    }

    public static class ComVersionAccessors extends VersionFactory  {

        private final ComGoogleVersionAccessors vaccForComGoogleVersionAccessors = new ComGoogleVersionAccessors(providers, config);
        private final ComIp2locationVersionAccessors vaccForComIp2locationVersionAccessors = new ComIp2locationVersionAccessors(providers, config);
        private final ComSunVersionAccessors vaccForComSunVersionAccessors = new ComSunVersionAccessors(providers, config);
        public ComVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.google</b>
         */
        public ComGoogleVersionAccessors getGoogle() {
            return vaccForComGoogleVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.com.ip2location</b>
         */
        public ComIp2locationVersionAccessors getIp2location() {
            return vaccForComIp2locationVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.com.sun</b>
         */
        public ComSunVersionAccessors getSun() {
            return vaccForComSunVersionAccessors;
        }

    }

    public static class ComGoogleVersionAccessors extends VersionFactory  {

        private final ComGoogleCodeVersionAccessors vaccForComGoogleCodeVersionAccessors = new ComGoogleCodeVersionAccessors(providers, config);
        public ComGoogleVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.google.code</b>
         */
        public ComGoogleCodeVersionAccessors getCode() {
            return vaccForComGoogleCodeVersionAccessors;
        }

    }

    public static class ComGoogleCodeVersionAccessors extends VersionFactory  {

        private final ComGoogleCodeGsonVersionAccessors vaccForComGoogleCodeGsonVersionAccessors = new ComGoogleCodeGsonVersionAccessors(providers, config);
        public ComGoogleCodeVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.google.code.gson</b>
         */
        public ComGoogleCodeGsonVersionAccessors getGson() {
            return vaccForComGoogleCodeGsonVersionAccessors;
        }

    }

    public static class ComGoogleCodeGsonVersionAccessors extends VersionFactory  {

        public ComGoogleCodeGsonVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>com.google.code.gson.gson</b> with value <b>2.10.1</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getGson() { return getVersion("com.google.code.gson.gson"); }

    }

    public static class ComIp2locationVersionAccessors extends VersionFactory  {

        private final ComIp2locationIp2locationVersionAccessors vaccForComIp2locationIp2locationVersionAccessors = new ComIp2locationIp2locationVersionAccessors(providers, config);
        public ComIp2locationVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.ip2location.ip2location</b>
         */
        public ComIp2locationIp2locationVersionAccessors getIp2location() {
            return vaccForComIp2locationIp2locationVersionAccessors;
        }

    }

    public static class ComIp2locationIp2locationVersionAccessors extends VersionFactory  {

        private final ComIp2locationIp2locationIoVersionAccessors vaccForComIp2locationIp2locationIoVersionAccessors = new ComIp2locationIp2locationIoVersionAccessors(providers, config);
        public ComIp2locationIp2locationVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>com.ip2location.ip2location.java</b> with value <b>8.11.2</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getJava() { return getVersion("com.ip2location.ip2location.java"); }

        /**
         * Group of versions at <b>versions.com.ip2location.ip2location.io</b>
         */
        public ComIp2locationIp2locationIoVersionAccessors getIo() {
            return vaccForComIp2locationIp2locationIoVersionAccessors;
        }

    }

    public static class ComIp2locationIp2locationIoVersionAccessors extends VersionFactory  {

        public ComIp2locationIp2locationIoVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>com.ip2location.ip2location.io.java</b> with value <b>1.0.0</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getJava() { return getVersion("com.ip2location.ip2location.io.java"); }

    }

    public static class ComSunVersionAccessors extends VersionFactory  {

        private final ComSunMailVersionAccessors vaccForComSunMailVersionAccessors = new ComSunMailVersionAccessors(providers, config);
        public ComSunVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.sun.mail</b>
         */
        public ComSunMailVersionAccessors getMail() {
            return vaccForComSunMailVersionAccessors;
        }

    }

    public static class ComSunMailVersionAccessors extends VersionFactory  {

        private final ComSunMailJavaxVersionAccessors vaccForComSunMailJavaxVersionAccessors = new ComSunMailJavaxVersionAccessors(providers, config);
        public ComSunMailVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.com.sun.mail.javax</b>
         */
        public ComSunMailJavaxVersionAccessors getJavax() {
            return vaccForComSunMailJavaxVersionAccessors;
        }

    }

    public static class ComSunMailJavaxVersionAccessors extends VersionFactory  {

        public ComSunMailJavaxVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>com.sun.mail.javax.mail</b> with value <b>1.6.2</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getMail() { return getVersion("com.sun.mail.javax.mail"); }

    }

    public static class JavaxVersionAccessors extends VersionFactory  {

        private final JavaxServletVersionAccessors vaccForJavaxServletVersionAccessors = new JavaxServletVersionAccessors(providers, config);
        public JavaxVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.javax.servlet</b>
         */
        public JavaxServletVersionAccessors getServlet() {
            return vaccForJavaxServletVersionAccessors;
        }

    }

    public static class JavaxServletVersionAccessors extends VersionFactory  {

        private final JavaxServletJavaxVersionAccessors vaccForJavaxServletJavaxVersionAccessors = new JavaxServletJavaxVersionAccessors(providers, config);
        private final JavaxServletJspVersionAccessors vaccForJavaxServletJspVersionAccessors = new JavaxServletJspVersionAccessors(providers, config);
        public JavaxServletVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.javax.servlet.javax</b>
         */
        public JavaxServletJavaxVersionAccessors getJavax() {
            return vaccForJavaxServletJavaxVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.javax.servlet.jsp</b>
         */
        public JavaxServletJspVersionAccessors getJsp() {
            return vaccForJavaxServletJspVersionAccessors;
        }

    }

    public static class JavaxServletJavaxVersionAccessors extends VersionFactory  {

        private final JavaxServletJavaxServletVersionAccessors vaccForJavaxServletJavaxServletVersionAccessors = new JavaxServletJavaxServletVersionAccessors(providers, config);
        public JavaxServletJavaxVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.javax.servlet.javax.servlet</b>
         */
        public JavaxServletJavaxServletVersionAccessors getServlet() {
            return vaccForJavaxServletJavaxServletVersionAccessors;
        }

    }

    public static class JavaxServletJavaxServletVersionAccessors extends VersionFactory  {

        public JavaxServletJavaxServletVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>javax.servlet.javax.servlet.api</b> with value <b>3.0.1</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getApi() { return getVersion("javax.servlet.javax.servlet.api"); }

    }

    public static class JavaxServletJspVersionAccessors extends VersionFactory  {

        private final JavaxServletJspJstlVersionAccessors vaccForJavaxServletJspJstlVersionAccessors = new JavaxServletJspJstlVersionAccessors(providers, config);
        public JavaxServletJspVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.javax.servlet.jsp.jstl</b>
         */
        public JavaxServletJspJstlVersionAccessors getJstl() {
            return vaccForJavaxServletJspJstlVersionAccessors;
        }

    }

    public static class JavaxServletJspJstlVersionAccessors extends VersionFactory  {

        private final JavaxServletJspJstlJavaxVersionAccessors vaccForJavaxServletJspJstlJavaxVersionAccessors = new JavaxServletJspJstlJavaxVersionAccessors(providers, config);
        private final JavaxServletJspJstlJstlVersionAccessors vaccForJavaxServletJspJstlJstlVersionAccessors = new JavaxServletJspJstlJstlVersionAccessors(providers, config);
        public JavaxServletJspJstlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.javax.servlet.jsp.jstl.javax</b>
         */
        public JavaxServletJspJstlJavaxVersionAccessors getJavax() {
            return vaccForJavaxServletJspJstlJavaxVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.javax.servlet.jsp.jstl.jstl</b>
         */
        public JavaxServletJspJstlJstlVersionAccessors getJstl() {
            return vaccForJavaxServletJspJstlJstlVersionAccessors;
        }

    }

    public static class JavaxServletJspJstlJavaxVersionAccessors extends VersionFactory  {

        private final JavaxServletJspJstlJavaxServletVersionAccessors vaccForJavaxServletJspJstlJavaxServletVersionAccessors = new JavaxServletJspJstlJavaxServletVersionAccessors(providers, config);
        public JavaxServletJspJstlJavaxVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.javax.servlet.jsp.jstl.javax.servlet</b>
         */
        public JavaxServletJspJstlJavaxServletVersionAccessors getServlet() {
            return vaccForJavaxServletJspJstlJavaxServletVersionAccessors;
        }

    }

    public static class JavaxServletJspJstlJavaxServletVersionAccessors extends VersionFactory  {

        private final JavaxServletJspJstlJavaxServletJspVersionAccessors vaccForJavaxServletJspJstlJavaxServletJspVersionAccessors = new JavaxServletJspJstlJavaxServletJspVersionAccessors(providers, config);
        public JavaxServletJspJstlJavaxServletVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.javax.servlet.jsp.jstl.javax.servlet.jsp</b>
         */
        public JavaxServletJspJstlJavaxServletJspVersionAccessors getJsp() {
            return vaccForJavaxServletJspJstlJavaxServletJspVersionAccessors;
        }

    }

    public static class JavaxServletJspJstlJavaxServletJspVersionAccessors extends VersionFactory  {

        private final JavaxServletJspJstlJavaxServletJspJstlVersionAccessors vaccForJavaxServletJspJstlJavaxServletJspJstlVersionAccessors = new JavaxServletJspJstlJavaxServletJspJstlVersionAccessors(providers, config);
        public JavaxServletJspJstlJavaxServletJspVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.javax.servlet.jsp.jstl.javax.servlet.jsp.jstl</b>
         */
        public JavaxServletJspJstlJavaxServletJspJstlVersionAccessors getJstl() {
            return vaccForJavaxServletJspJstlJavaxServletJspJstlVersionAccessors;
        }

    }

    public static class JavaxServletJspJstlJavaxServletJspJstlVersionAccessors extends VersionFactory  {

        public JavaxServletJspJstlJavaxServletJspJstlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>javax.servlet.jsp.jstl.javax.servlet.jsp.jstl.api</b> with value <b>1.2.1</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getApi() { return getVersion("javax.servlet.jsp.jstl.javax.servlet.jsp.jstl.api"); }

    }

    public static class JavaxServletJspJstlJstlVersionAccessors extends VersionFactory  {

        public JavaxServletJspJstlJstlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>javax.servlet.jsp.jstl.jstl.api</b> with value <b>1.2</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getApi() { return getVersion("javax.servlet.jsp.jstl.jstl.api"); }

    }

    public static class JunitVersionAccessors extends VersionFactory  {

        public JunitVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>junit.junit</b> with value <b>3.8.1</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getJunit() { return getVersion("junit.junit"); }

    }

    public static class MysqlVersionAccessors extends VersionFactory  {

        private final MysqlMysqlVersionAccessors vaccForMysqlMysqlVersionAccessors = new MysqlMysqlVersionAccessors(providers, config);
        public MysqlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.mysql.mysql</b>
         */
        public MysqlMysqlVersionAccessors getMysql() {
            return vaccForMysqlMysqlVersionAccessors;
        }

    }

    public static class MysqlMysqlVersionAccessors extends VersionFactory  {

        private final MysqlMysqlConnectorVersionAccessors vaccForMysqlMysqlConnectorVersionAccessors = new MysqlMysqlConnectorVersionAccessors(providers, config);
        public MysqlMysqlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.mysql.mysql.connector</b>
         */
        public MysqlMysqlConnectorVersionAccessors getConnector() {
            return vaccForMysqlMysqlConnectorVersionAccessors;
        }

    }

    public static class MysqlMysqlConnectorVersionAccessors extends VersionFactory  {

        public MysqlMysqlConnectorVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>mysql.mysql.connector.java</b> with value <b>8.0.30</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getJava() { return getVersion("mysql.mysql.connector.java"); }

    }

    public static class OrgVersionAccessors extends VersionFactory  {

        private final OrgApacheVersionAccessors vaccForOrgApacheVersionAccessors = new OrgApacheVersionAccessors(providers, config);
        private final OrgJavafxdataVersionAccessors vaccForOrgJavafxdataVersionAccessors = new OrgJavafxdataVersionAccessors(providers, config);
        public OrgVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.apache</b>
         */
        public OrgApacheVersionAccessors getApache() {
            return vaccForOrgApacheVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.org.javafxdata</b>
         */
        public OrgJavafxdataVersionAccessors getJavafxdata() {
            return vaccForOrgJavafxdataVersionAccessors;
        }

    }

    public static class OrgApacheVersionAccessors extends VersionFactory  {

        private final OrgApacheTaglibsVersionAccessors vaccForOrgApacheTaglibsVersionAccessors = new OrgApacheTaglibsVersionAccessors(providers, config);
        private final OrgApacheTomcatVersionAccessors vaccForOrgApacheTomcatVersionAccessors = new OrgApacheTomcatVersionAccessors(providers, config);
        public OrgApacheVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.apache.taglibs</b>
         */
        public OrgApacheTaglibsVersionAccessors getTaglibs() {
            return vaccForOrgApacheTaglibsVersionAccessors;
        }

        /**
         * Group of versions at <b>versions.org.apache.tomcat</b>
         */
        public OrgApacheTomcatVersionAccessors getTomcat() {
            return vaccForOrgApacheTomcatVersionAccessors;
        }

    }

    public static class OrgApacheTaglibsVersionAccessors extends VersionFactory  {

        private final OrgApacheTaglibsTaglibsVersionAccessors vaccForOrgApacheTaglibsTaglibsVersionAccessors = new OrgApacheTaglibsTaglibsVersionAccessors(providers, config);
        public OrgApacheTaglibsVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.apache.taglibs.taglibs</b>
         */
        public OrgApacheTaglibsTaglibsVersionAccessors getTaglibs() {
            return vaccForOrgApacheTaglibsTaglibsVersionAccessors;
        }

    }

    public static class OrgApacheTaglibsTaglibsVersionAccessors extends VersionFactory  {

        private final OrgApacheTaglibsTaglibsStandardVersionAccessors vaccForOrgApacheTaglibsTaglibsStandardVersionAccessors = new OrgApacheTaglibsTaglibsStandardVersionAccessors(providers, config);
        public OrgApacheTaglibsTaglibsVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.apache.taglibs.taglibs.standard</b>
         */
        public OrgApacheTaglibsTaglibsStandardVersionAccessors getStandard() {
            return vaccForOrgApacheTaglibsTaglibsStandardVersionAccessors;
        }

    }

    public static class OrgApacheTaglibsTaglibsStandardVersionAccessors extends VersionFactory  {

        public OrgApacheTaglibsTaglibsStandardVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>org.apache.taglibs.taglibs.standard.impl</b> with value <b>1.2.5</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getImpl() { return getVersion("org.apache.taglibs.taglibs.standard.impl"); }

        /**
         * Version alias <b>org.apache.taglibs.taglibs.standard.jstlel</b> with value <b>1.2.5</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getJstlel() { return getVersion("org.apache.taglibs.taglibs.standard.jstlel"); }

        /**
         * Version alias <b>org.apache.taglibs.taglibs.standard.spec</b> with value <b>1.2.5</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getSpec() { return getVersion("org.apache.taglibs.taglibs.standard.spec"); }

    }

    public static class OrgApacheTomcatVersionAccessors extends VersionFactory  {

        private final OrgApacheTomcatTomcatVersionAccessors vaccForOrgApacheTomcatTomcatVersionAccessors = new OrgApacheTomcatTomcatVersionAccessors(providers, config);
        public OrgApacheTomcatVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.apache.tomcat.tomcat</b>
         */
        public OrgApacheTomcatTomcatVersionAccessors getTomcat() {
            return vaccForOrgApacheTomcatTomcatVersionAccessors;
        }

    }

    public static class OrgApacheTomcatTomcatVersionAccessors extends VersionFactory  {

        public OrgApacheTomcatTomcatVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>org.apache.tomcat.tomcat.util</b> with value <b>9.0.16</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getUtil() { return getVersion("org.apache.tomcat.tomcat.util"); }

    }

    public static class OrgJavafxdataVersionAccessors extends VersionFactory  {

        private final OrgJavafxdataDatafxVersionAccessors vaccForOrgJavafxdataDatafxVersionAccessors = new OrgJavafxdataDatafxVersionAccessors(providers, config);
        public OrgJavafxdataVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Group of versions at <b>versions.org.javafxdata.datafx</b>
         */
        public OrgJavafxdataDatafxVersionAccessors getDatafx() {
            return vaccForOrgJavafxdataDatafxVersionAccessors;
        }

    }

    public static class OrgJavafxdataDatafxVersionAccessors extends VersionFactory  {

        public OrgJavafxdataDatafxVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>org.javafxdata.datafx.datareader</b> with value <b>8.0b5</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getDatareader() { return getVersion("org.javafxdata.datafx.datareader"); }

    }

    public static class TaglibsVersionAccessors extends VersionFactory  {

        public TaglibsVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Version alias <b>taglibs.standard</b> with value <b>1.1.2</b>
         * <p>
         * If the version is a rich version and cannot be represented as a
         * single version string, an empty string is returned.
         * <p>
         * This version was declared in catalog libs.versions.toml
         */
        public Provider<String> getStandard() { return getVersion("taglibs.standard"); }

    }

    /**
     * @deprecated Will be removed in Gradle 9.0.
     */
    @Deprecated
    public static class BundleAccessors extends BundleFactory {

        public BundleAccessors(ObjectFactory objects, ProviderFactory providers, DefaultVersionCatalog config, ImmutableAttributesFactory attributesFactory, CapabilityNotationParser capabilityNotationParser) { super(objects, providers, config, attributesFactory, capabilityNotationParser); }

    }

    public static class PluginAccessors extends PluginFactory {

        public PluginAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

    }

}
