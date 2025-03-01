(********************************************************)
(*                                                      *)
(*  Open Asset Import Library                           *)
(*  from v5.4.3 published on 2024-08-30                 *)
(*                                                      *)
(*  Free Pascal interface by admin@getlazarus.org       *)
(*  https://www.getlazarus.org                          *)
(*                                                      *)
(*  Published under the zlib license                    *)
(*                                                      *)
(********************************************************)
unit Assimp;

{$mode delphi}

interface

const
  AssimpVersion = 'v5.4.3';

type
  aiInt = Integer;
  aiUInt = Cardinal;
  aiInt32 = Int32;
  aiUInt32 = UInt32;
  aiBool = Integer;

  aiReal = Single;
  PaiReal = ^aiReal;

{ aiList<T> provides a clearer way to access pointers to arrays }

  aiList<T> = record
    items: array[0..MaxInt] of T;
  end;

const
  (* Calculates the tangents and bitangents for the imported meshes.
   *
   * Does nothing if a mesh does not have normals. You might want this post
   * processing step to be executed if you plan to use tangent space calculations
   * such as normal mapping  applied to the meshes. There's an importer property,
   * <tt>#AI_CONFIG_PP_CT_MAX_SMOOTHING_ANGLE</tt>, which allows you to specify
   * a maximum smoothing angle for the algorithm. However, usually you'll
   * want to leave it at the default value.
   *)
  aiProcess_CalcTangentSpace = $1;

  (* Identifies and joins identical vertex data sets within all
   *  imported meshes.
   *
   * After this step is run, each mesh contains unique vertices,
   * so a vertex may be used by multiple faces. You usually want
   * to use this post processing step. If your application deals with
   * indexed geometry, this step is compulsory or you'll just waste rendering
   * time. <b>If this flag is not specified</b>, no vertices are referenced by
   * more than one face and <b>no index buffer is required</b> for rendering.
   * Unless the importer (like ply) had to split vertices. Then you need one regardless.
   *)
  aiProcess_JoinIdenticalVertices = $2;

  (* Converts all the imported data to a left-handed coordinate space.
   *
   * By default the data is returned in a right-handed coordinate space (which
   * OpenGL prefers). In this space, +X points to the right,
   * +Z points towards the viewer, and +Y points upwards. In the DirectX
   * coordinate space +X points to the right, +Y points upwards, and +Z points
   * away from the viewer.
   *
   * You'll probably want to consider this flag if you use Direct3D for
   * rendering. The #aiProcess_ConvertToLeftHanded flag supersedes this
   * setting and bundles all conversions typically required for D3D-based
   * applications.
   *)
  aiProcess_MakeLeftHanded = $4;

  (* Triangulates all faces of all meshes.
   *
   * By default the imported mesh data might contain faces with more than 3
   * indices. For rendering you'll usually want all faces to be triangles.
   * This post processing step splits up faces with more than 3 indices into
   * triangles. Line and point primitives are *not* modified! If you want
   * 'triangles only' with no other kinds of primitives, try the following
   * solution:
   * <ul>
   * <li>Specify both #aiProcess_Triangulate and #aiProcess_SortByPType </li>
   * <li>Ignore all point and line meshes when you process assimp's output</li>
   * </ul>
   *)
  aiProcess_Triangulate = $8;

  (* Removes some parts of the data structure (animations, materials,
   *  light sources, cameras, textures, vertex components).
   *
   * The  components to be removed are specified in a separate
   * importer property, <tt>#AI_CONFIG_PP_RVC_FLAGS</tt>. This is quite useful
   * if you don't need all parts of the output structure. Vertex colors
   * are rarely used today for example... Calling this step to remove unneeded
   * data from the pipeline as early as possible results in increased
   * performance and a more optimized output data structure.
   * This step is also useful if you want to force Assimp to recompute
   * normals or tangents. The corresponding steps don't recompute them if
   * they're already there (loaded from the source asset). By using this
   * step you can make sure they are NOT there.
   *
   * This flag is a poor one, mainly because its purpose is usually
   * misunderstood. Consider the following case: a 3D model has been exported
   * from a CAD app, and it has per-face vertex colors. Vertex positions can't be
   * shared, thus the #aiProcess_JoinIdenticalVertices step fails to
   * optimize the data because of these nasty little vertex colors.
   * Most apps don't even process them, so it's all for nothing. By using
   * this step, unneeded components are excluded as early as possible
   * thus opening more room for internal optimizations.
   *)
  aiProcess_RemoveComponent = $10;

  (* Generates normals for all faces of all meshes.
   *
   * This is ignored if normals are already there at the time this flag
   * is evaluated. Model importers try to load them from the source file, so
   * they're usually already there. Face normals are shared between all points
   * of a single face, so a single point can have multiple normals, which
   * forces the library to duplicate vertices in some cases.
   * #aiProcess_JoinIdenticalVertices is *senseless* then.
   *
   * This flag may not be specified together with #aiProcess_GenSmoothNormals.
   *)
  aiProcess_GenNormals = $20;

  (* Generates smooth normals for all vertices in the mesh.
  *
  * This is ignored if normals are already there at the time this flag
  * is evaluated. Model importers try to load them from the source file, so
  * they're usually already there.
  *
  * This flag may not be specified together with
  * #aiProcess_GenNormals. There's a importer property,
  * <tt>#AI_CONFIG_PP_GSN_MAX_SMOOTHING_ANGLE</tt> which allows you to specify
  * an angle maximum for the normal smoothing algorithm. Normals exceeding
  * this limit are not smoothed, resulting in a 'hard' seam between two faces.
  * Using a decent angle here (e.g. 80 degrees) results in very good visual
  * appearance.
  *)
  aiProcess_GenSmoothNormals = $40;

  (* Splits large meshes into smaller sub-meshes.
  *
  * This is quite useful for real-time rendering, where the number of triangles
  * which can be maximally processed in a single draw-call is limited
  * by the video driver/hardware. The maximum vertex buffer is usually limited
  * too. Both requirements can be met with this step: you may specify both a
  * triangle and vertex limit for a single mesh.
  *
  * The split limits can (and should!) be set through the
  * <tt>#AI_CONFIG_PP_SLM_VERTEX_LIMIT</tt> and <tt>#AI_CONFIG_PP_SLM_TRIANGLE_LIMIT</tt>
  * importer properties. The default values are <tt>#AI_SLM_DEFAULT_MAX_VERTICES</tt> and
  * <tt>#AI_SLM_DEFAULT_MAX_TRIANGLES</tt>.
  *
  * Note that splitting is generally a time-consuming task, but only if there's
  * something to split. The use of this step is recommended for most users.
  *)
  aiProcess_SplitLargeMeshes = $80;

  (* Removes the node graph and pre-transforms all vertices with
  * the local transformation matrices of their nodes.
  *
  * If the resulting scene can be reduced to a single mesh, with a single
  * material, no lights, and no cameras, then the output scene will contain
  * only a root node (with no children) that references the single mesh.
  * Otherwise, the output scene will be reduced to a root node with a single
  * level of child nodes, each one referencing one mesh, and each mesh
  * referencing one material.
  *
  * In either case, for rendering, you can
  * simply render all meshes in order - you don't need to pay
  * attention to local transformations and the node hierarchy.
  * Animations are removed during this step.
  * This step is intended for applications without a scenegraph.
  * The step CAN cause some problems: if e.g. a mesh of the asset
  * contains normals and another, using the same material index, does not,
  * they will be brought together, but the first meshes's part of
  * the normal list is zeroed. However, these artifacts are rare.
  * @note The <tt>#AI_CONFIG_PP_PTV_NORMALIZE</tt> configuration property
  * can be set to normalize the scene's spatial dimension to the -1...1
  * range.
  *)
  aiProcess_PreTransformVertices = $100;

  (* Limits the number of bones simultaneously affecting a single vertex
  *  to a maximum value.
  *
  * If any vertex is affected by more than the maximum number of bones, the least
  * important vertex weights are removed and the remaining vertex weights are
  * renormalized so that the weights still sum up to 1.
  * The default bone weight limit is 4 (defined as <tt>#AI_LMW_MAX_WEIGHTS</tt> in
  * config.h), but you can use the <tt>#AI_CONFIG_PP_LBW_MAX_WEIGHTS</tt> importer
  * property to supply your own limit to the post processing step.
  *
  * If you intend to perform the skinning in hardware, this post processing
  * step might be of interest to you.
  *)
  aiProcess_LimitBoneWeights = $200;

  (* Validates the imported scene data structure.
   * This makes sure that all indices are valid, all animations and
   * bones are linked correctly, all material references are correct .. etc.
   *
   * It is recommended that you capture Assimp's log output if you use this flag,
   * so you can easily find out what's wrong if a file fails the
   * validation. The validator is quite strict and will find *all*
   * inconsistencies in the data structure... It is recommended that plugin
   * developers use it to debug their loaders. There are two types of
   * validation failures:
   * <ul>
   * <li>Error: There's something wrong with the imported data. Further
   *   postprocessing is not possible and the data is not usable at all.
   *   The import fails. #Importer::GetErrorString() or #aiGetErrorString()
   *   carry the error message around.</li>
   * <li>Warning: There are some minor issues (e.g. 1000000 animation
   *   keyframes with the same time), but further postprocessing and use
   *   of the data structure is still safe. Warning details are written
   *   to the log file, <tt>#AI_SCENE_FLAGS_VALIDATION_WARNING</tt> is set
   *   in #aiScene::mFlags</li>
   * </ul>
   *
   * This post-processing step is not time-consuming. Its use is not
   * compulsory, but recommended.
  *)
  aiProcess_ValidateDataStructure = $400;

  (* Reorders triangles for better vertex cache locality.
   *
   * The step tries to improve the ACMR (average post-transform vertex cache
   * miss ratio) for all meshes. The implementation runs in O(n) and is
   * roughly based on the 'tipsify' algorithm (see <a href="
   * http://www.cs.princeton.edu/gfx/pubs/Sander_2007_%3ETR/tipsy.pdf">this
   * paper</a>).
   *
   * If you intend to render huge models in hardware, this step might
   * be of interest to you. The <tt>#AI_CONFIG_PP_ICL_PTCACHE_SIZE</tt>
   * importer property can be used to fine-tune the cache optimization.
   *)
  aiProcess_ImproveCacheLocality = $800;

  (* Searches for redundant/unreferenced materials and removes them.
   *
   * This is especially useful in combination with the
   * #aiProcess_PreTransformVertices and #aiProcess_OptimizeMeshes flags.
   * Both join small meshes with equal characteristics, but they can't do
   * their work if two meshes have different materials. Because several
   * material settings are lost during Assimp's import filters,
   * (and because many exporters don't check for redundant materials), huge
   * models often have materials which are are defined several times with
   * exactly the same settings.
   *
   * Several material settings not contributing to the final appearance of
   * a surface are ignored in all comparisons (e.g. the material name).
   * So, if you're passing additional information through the
   * content pipeline (probably using *magic* material names), don't
   * specify this flag. Alternatively take a look at the
   * <tt>#AI_CONFIG_PP_RRM_EXCLUDE_LIST</tt> importer property.
   *)
  aiProcess_RemoveRedundantMaterials = $1000;

  (* This step tries to determine which meshes have normal vectors
   * that are facing inwards and inverts them.
   *
   * The algorithm is simple but effective:
   * the bounding box of all vertices + their normals is compared against
   * the volume of the bounding box of all vertices without their normals.
   * This works well for most objects, problems might occur with planar
   * surfaces. However, the step tries to filter such cases.
   * The step inverts all in-facing normals. Generally it is recommended
   * to enable this step, although the result is not always correct.
  *)
  aiProcess_FixInfacingNormals = $2000;

  (**
   * This step generically populates aiBone->mArmature and aiBone->mNode generically
   * The point of these is it saves you later having to calculate these elements
   * This is useful when handling rest information or skin information
   * If you have multiple armatures on your models we strongly recommend enabling this
   * Instead of writing your own multi-root, multi-armature lookups we have done the
   * hard work for you :)
 *)
  aiProcess_PopulateArmatureData = $4000;

  (* This step splits meshes with more than one primitive type in
   *  homogeneous sub-meshes.
   *
   *  The step is executed after the triangulation step. After the step
   *  returns, just one bit is set in aiMesh::mPrimitiveTypes. This is
   *  especially useful for real-time rendering where point and line
   *  primitives are often ignored or rendered separately.
   *  You can use the <tt>#AI_CONFIG_PP_SBP_REMOVE</tt> importer property to
   *  specify which primitive types you need. This can be used to easily
   *  exclude lines and points, which are rarely used, from the import.
  *)
  aiProcess_SortByPType = $8000;

  (* This step searches all meshes for degenerate primitives and
   *  converts them to proper lines or points.
   *
   * A face is 'degenerate' if one or more of its points are identical.
   * To have the degenerate stuff not only detected and collapsed but
   * removed, try one of the following procedures:
   * <br><b>1.</b> (if you support lines and points for rendering but don't
   *    want the degenerates)<br>
   * <ul>
   *   <li>Specify the #aiProcess_FindDegenerates flag.
   *   </li>
   *   <li>Set the <tt>#AI_CONFIG_PP_FD_REMOVE</tt> importer property to
   *       1. This will cause the step to remove degenerate triangles from the
   *       import as soon as they're detected. They won't pass any further
   *       pipeline steps.
   *   </li>
   * </ul>
   * <br><b>2.</b>(if you don't support lines and points at all)<br>
   * <ul>
   *   <li>Specify the #aiProcess_FindDegenerates flag.
   *   </li>
   *   <li>Specify the #aiProcess_SortByPType flag. This moves line and
   *     point primitives to separate meshes.
   *   </li>
   *   <li>Set the <tt>#AI_CONFIG_PP_SBP_REMOVE</tt> importer property to
   *       @code aiPrimitiveType_POINT | aiPrimitiveType_LINE
   *       @endcode to cause SortByPType to reject point
   *       and line meshes from the scene.
   *   </li>
   * </ul>
   *
   * This step also removes very small triangles with a surface area smaller
   * than 10^-6. If you rely on having these small triangles, or notice holes
   * in your model, set the property <tt>#AI_CONFIG_PP_FD_CHECKAREA</tt> to
   * false.
   * @note Degenerate polygons are not necessarily evil and that's why
   * they're not removed by default. There are several file formats which
   * don't support lines or points, and some exporters bypass the
   * format specification and write them as degenerate triangles instead.
  *)
  aiProcess_FindDegenerates = $10000;

  (* This step searches all meshes for invalid data, such as zeroed
   *  normal vectors or invalid UV coords and removes/fixes them. This is
   *  intended to get rid of some common exporter errors.
   *
   * This is especially useful for normals. If they are invalid, and
   * the step recognizes this, they will be removed and can later
   * be recomputed, i.e. by the #aiProcess_GenSmoothNormals flag.<br>
   * The step will also remove meshes that are infinitely small and reduce
   * animation tracks consisting of hundreds if redundant keys to a single
   * key. The <tt>AI_CONFIG_PP_FID_ANIM_ACCURACY</tt> config property decides
   * the accuracy of the check for duplicate animation tracks.
  *)
  aiProcess_FindInvalidData = $20000;

  (* This step converts non-UV mappings (such as spherical or
   *  cylindrical mapping) to proper texture coordinate channels.
   *
   * Most applications will support UV mapping only, so you will
   * probably want to specify this step in every case. Note that Assimp is not
   * always able to match the original mapping implementation of the
   * 3D app which produced a model perfectly. It's always better to let the
   * modelling app compute the UV channels - 3ds max, Maya, Blender,
   * LightWave, and Modo do this for example.
   *
   * @note If this step is not requested, you'll need to process the
   * <tt>#AI_MATKEY_MAPPING</tt> material property in order to display all assets
   * properly.
   *)
  aiProcess_GenUVCoords = $40000;

  (* This step applies per-texture UV transformations and bakes
   *  them into stand-alone vtexture coordinate channels.
   *
   * UV transformations are specified per-texture - see the
   * <tt>#AI_MATKEY_UVTRANSFORM</tt> material key for more information.
   * This step processes all textures with
   * transformed input UV coordinates and generates a new (pre-transformed) UV channel
   * which replaces the old channel. Most applications won't support UV
   * transformations, so you will probably want to specify this step.
   *
   * @note UV transformations are usually implemented in real-time apps by
   * transforming texture coordinates at vertex shader stage with a 3x3
   * (homogeneous) transformation matrix.
  *)
  aiProcess_TransformUVCoords = $80000;

  (* This step searches for duplicate meshes and replaces them
   *  with references to the first mesh.
   *
   *  This step takes a while, so don't use it if speed is a concern.
   *  Its main purpose is to workaround the fact that many export
   *  file formats don't support instanced meshes, so exporters need to
   *  duplicate meshes. This step removes the duplicates again. Please
   *  note that Assimp does not currently support per-node material
   *  assignment to meshes, which means that identical meshes with
   *  different materials are currently *not* joined, although this is
   *  planned for future versions.
   *)
  aiProcess_FindInstances = $100000;

  (* A post-processing step to reduce the number of meshes.
   *
   *  This will, in fact, reduce the number of draw calls.
   *
   *  This is a very effective optimization and is recommended to be used
   *  together with #aiProcess_OptimizeGraph, if possible. The flag is fully
   *  compatible with both #aiProcess_SplitLargeMeshes and #aiProcess_SortByPType.
  *)
  aiProcess_OptimizeMeshes  = $200000;

  (* A post-processing step to optimize the scene hierarchy.
   *
   *  Nodes without animations, bones, lights or cameras assigned are
   *  collapsed and joined.
   *
   *  Node names can be lost during this step. If you use special 'tag nodes'
   *  to pass additional information through your content pipeline, use the
   *  <tt>#AI_CONFIG_PP_OG_EXCLUDE_LIST</tt> importer property to specify a
   *  list of node names you want to be kept. Nodes matching one of the names
   *  in this list won't be touched or modified.
   *
   *  Use this flag with caution. Most simple files will be collapsed to a
   *  single node, so complex hierarchies are usually completely lost. This is not
   *  useful for editor environments, but probably a very effective
   *  optimization if you just want to get the model data, convert it to your
   *  own format, and render it as fast as possible.
   *
   *  This flag is designed to be used with #aiProcess_OptimizeMeshes for best
   *  results.
   *
   *  @note 'Crappy' scenes with thousands of extremely small meshes packed
   *  in deeply nested nodes exist for almost all file formats.
   *  #aiProcess_OptimizeMeshes in combination with #aiProcess_OptimizeGraph
   *  usually fixes them all and makes them renderable.
  *)
  aiProcess_OptimizeGraph  = $400000;

  (* This step flips all UV coordinates along the y-axis and adjusts
   * material settings and bitangents accordingly.
   *
   * <b>Output UV coordinate system:</b>
   * @code
   * 0x|0y ---------- 1x|0y
   * |                 |
   * |                 |
   * |                 |
   * 0x|1y ---------- 1x|1y
   * @endcode
   *
   * You'll probably want to consider this flag if you use Direct3D for
   * rendering. The #aiProcess_ConvertToLeftHanded flag supersedes this
   * setting and bundles all conversions typically required for D3D-based
   * applications.
  *)
  aiProcess_FlipUVs = $800000;

  (* This step adjusts the output face winding order to be CW.
   *
   * The default face winding order is counter clockwise (CCW).
   *
   * <b>Output face order:</b>
   * @code
   *       x2
   *
   *                         x0
   *  x1
   * @endcode
  *)
  aiProcess_FlipWindingOrder  = $1000000;

  (* This step splits meshes with many bones into sub-meshes so that each
   * sub-mesh has fewer or as many bones as a given limit.
  *)
  aiProcess_SplitByBoneCount  = $2000000;

  (* This step removes bones losslessly or according to some threshold.
   *
   *  In some cases (i.e. formats that require it) exporters are forced to
   *  assign dummy bone weights to otherwise static meshes assigned to
   *  animated meshes. Full, weight-based skinning is expensive while
   *  animating nodes is extremely cheap, so this step is offered to clean up
   *  the data in that regard.
   *
   *  Use <tt>#AI_CONFIG_PP_DB_THRESHOLD</tt> to control this.
   *  Use <tt>#AI_CONFIG_PP_DB_ALL_OR_NONE</tt> if you want bones removed if and
   *  only if all bones within the scene qualify for removal.
  *)
  aiProcess_Debone  = $4000000;

  (* This step will perform a global scale of the model.
  *
  *  Some importers are providing a mechanism to define a scaling unit for the
  *  model. This post processing step can be used to do so. You need to get the
  *  global scaling from your importer settings like in FBX. Use the flag
  *  AI_CONFIG_GLOBAL_SCALE_FACTOR_KEY from the global property table to configure this.
  *
  *  Use <tt>#AI_CONFIG_GLOBAL_SCALE_FACTOR_KEY</tt> to setup the global scaling factor.
  *)
  aiProcess_GlobalScale = $8000000;

  (* A postprocessing step to embed of textures.
   *
   *  This will remove external data dependencies for textures.
   *  If a texture's file does not exist at the specified path
   *  (due, for instance, to an absolute path generated on another system),
   *  it will check if a file with the same name exists at the root folder
   *  of the imported model. And if so, it uses that.
   *)
  aiProcess_EmbedTextures  = $10000000;

  (* Generates face normals if none were present
   *
   *)
  aiProcess_ForceGenNormals = $20000000;

  (* Drops normals for all faces of all meshes.
   *
   * This is ignored if no normals are present.
   * Face normals are shared between all points of a single face,
   * so a single point can have multiple normals, which
   * forces the library to duplicate vertices in some cases.
   * #aiProcess_JoinIdenticalVertices is *senseless* then.
   * This process gives sense back to aiProcess_JoinIdenticalVertices
   *)
  aiProcess_DropNormals = $40000000;

  (* Generates bounding boxes of all meshes.
   *
   *)
  aiProcess_GenBoundingBoxes = $80000000;

{ Some default processing of my own preference }
  aiProcess_Default = aiProcess_PreTransformVertices or
    aiProcess_JoinIdenticalVertices or aiProcess_OptimizeMeshes or aiProcess_GenBoundingBoxes;

const
  aiComponent_NORMALS = $2;
  aiComponent_TANGENTS_AND_BITANGENTS = $4;
  aiComponent_COLORS = $8;
  aiComponent_TEXCOORDS = $10;
  aiComponent_BONEWEIGHTS = $20;
  aiComponent_ANIMATIONS = $40;
  aiComponent_TEXTURES = $80;
  aiComponent_LIGHTS = $100;
  aiComponent_CAMERAS = $200;
  aiComponent_MESHES = $400;
  aiComponent_MATERIALS = $800;

type
  aiMetadataType = (
    AI_BOOL = 0,
    AI_INT32 = 1,
    AI_UINT64 = 2,
    AI_FLOAT = 3,
    AI_DOUBLE = 4,
    AI_AISTRING = 5,
    AI_AIVECTOR3D = 6,
    AI_AIMETADATA = 7,
    AI_INT64 = 8,
    AI_UINT32 = 9,
    AI_META_MAX = 10
  );

  aiPrimitiveType = (
    aiPrimitiveType_POINT = $1,
    aiPrimitiveType_LINE = $2,
    aiPrimitiveType_TRIANGLE = $4,
    aiPrimitiveType_POLYGON = $8,
    aiPrimitiveType_NGONEncodingFlag = $10
  );

  aiMorphingMethod = (
    aiMorphingMethod_UNKNOWN = $0,
    aiMorphingMethod_VERTEX_BLEND = $1,
    aiMorphingMethod_MORPH_NORMALIZED = $2,
    aiMorphingMethod_MORPH_RELATIVE = $3
  );

  aiLightSourceType = (
    aiLightSource_UNDEFINED = $0,
    aiLightSource_DIRECTIONAL = $1,
    aiLightSource_POINT = $2,
    aiLightSource_SPOT = $3,
    aiLightSource_AMBIENT = $4,
    aiLightSource_AREA = $5
  );

  aiReturn = (
	  aiReturn_OUTOFMEMORY = -$3,
    aiReturn_FAILURE = -$1,
    aiReturn_SUCCESS = $0
  );

  aiOrigin = (
    aiOrigin_SET = $0,
    aiOrigin_CUR = $1,
    aiOrigin_END = $2
  );

  aiDefaultLogStream = (
    aiDefaultLogStream_FILE = $1,
    aiDefaultLogStream_STDOUT = $2,
    aiDefaultLogStream_STDERR = $4,
    aiDefaultLogStream_DEBUGGER = $8
  );

  aiImporterFlags = (
    aiImporterFlags_SupportTextFlavour = $1,
    aiImporterFlags_SupportBinaryFlavour = $2,
    aiImporterFlags_SupportCompressedFlavour = $4,
    aiImporterFlags_LimitedSupport = $8,
    aiImporterFlags_Experimental = $10
  );

  aiShadingMode = (
    aiShadingMode_Flat = $1,
    aiShadingMode_Gouraud = $2,
    aiShadingMode_Phong = $3,
    aiShadingMode_Blinn = $4,
    aiShadingMode_Toon = $5,
    aiShadingMode_OrenNayar = $6,
    aiShadingMode_Minnaert = $7,
    aiShadingMode_CookTorrance = $8,
    aiShadingMode_NoShading = $9,
    // aiShadingMode_Unlit = aiShadingMode_NoShading,
    aiShadingMode_Fresnel = $A,
    aiShadingMode_PBR_BRDF = $B
  );

  aiTextureFlags = (
    aiTextureFlags_Invert = $1,
    aiTextureFlags_UseAlpha = $2,
    aiTextureFlags_IgnoreAlpha = $4
  );

  aiBlendMode = (
    aiBlendMode_Default = $0,
    aiBlendMode_Additive = $1
  );

  aiPropertyTypeInfo = (
    aiPTI_Float = $1,
    aiPTI_Double = $2,
    aiPTI_String = $3,
    aiPTI_Integer = $4,
    aiPTI_Buffer = $5
  );

  aiAnimInterpolation = (
    aiAnimInterpolation_Step,
    aiAnimInterpolation_Linear,
    aiAnimInterpolation_Spherical_Linear,
    aiAnimInterpolation_Cubic_Spline
  );

  aiAnimBehaviour = (
    aiAnimBehaviour_DEFAULT = $0,
    aiAnimBehaviour_CONSTANT = $1,
    aiAnimBehaviour_LINEAR = $2,
    aiAnimBehaviour_REPEAT = $3
  );

type
  PaiVector2D = ^aiVector2D;
  aiVector2D = record
    x, y: aiReal;
  end;

  PaiVector3D = ^aiVector3D;
  aiVector3D = record
    x, y, z: aiReal;
  end;

  PaiColor4D = ^aiColor4D;
  aiColor4D = record
    r, g, b, a: Single;
  end;

  PaiMatrix3x3 = ^aiMatrix3x3;
  aiMatrix3x3 = record
    a1, a2, a3: aiReal;
    b1, b2, b3: aiReal;
    c1, c2, c3: aiReal;
  end;

  PaiMatrix4x4 = ^aiMatrix4x4;
  aiMatrix4x4 = record
    a1, a2, a3, a4: aiReal;
    b1, b2, b3, b4: aiReal;
    c1, c2, c3, c4: aiReal;
    d1, d2, d3, d4: aiReal;
  end;

  PaiQuaternion = ^aiQuaternion;
  aiQuaternion = record
    w, x, y, z: aiReal;
  end;

  PaiPlane = ^aiPlane;
  aiPlane = record
    a, b, c, d: aiReal;
  end;

  PaiRay = ^aiRay;
  aiRay = record
    pos, dir: aiVector3D;
  end;

  PaiColor3D = ^aiColor3D;
  aiColor3D = record
    r, g, b: Single;
  end;

  PaiString = ^aiString;
  aiString = record
    length: aiUInt32;
    data: array[0..1023] of Char;
    function ToString: string;
  end;

  PaiAABB = ^aiAABB;
  aiAABB = record
    mMin, mMax: aiVector3D;
  end;

  PaiFace = ^aiFace;
  aiFace = record
    mNumIndices: Cardinal;
    mIndices: ^aiList<Cardinal>;
  end;

  PaiVertexWeight = ^aiVertexWeight;
  aiVertexWeight = record
    mVertexId: Cardinal;
    mWeight: aiReal;
  end;

  PaiMetadataEntry = ^aiMetadataEntry;
  aiMetadataEntry = record
    mType: aiMetadataType;
    mData: Pointer;
  end;

  PaiMetadata = ^aiMetadata;
  aiMetadata = record
    mNumProperties: Cardinal;
    mKeys: ^aiList<aiString>;
    mValues: ^aiList<aiMetadataEntry>;
  end;

  PaiNode = ^aiNode;
  aiNode = record
    mName: aiString;
    mTransformation: aiMatrix4x4;
    mParent: PaiNode;
    mNumChildren: Cardinal;
    mChildren: ^aiList<PaiNode>;
    mNumMeshes: Cardinal;
    mMeshes: ^aiList<Cardinal>;
    mMetaData: PaiMetadata;
  end;

  PaiBone = ^aiBone;
  aiBone = record
    mName: aiString;
    mNumWeights: Cardinal;
    mArmature, mNode: PaiNode;
    mWeights: ^aiList<aiVertexWeight>;
    mOffsetMatrix: aiMatrix4x4;
  end;

  PaiAnimMesh = ^aiAnimMesh;
  aiAnimMesh = record
    mName: aiString;
    mVertices, mNormals, mTangents, mBitangents: ^aiList<aiVector3D>;
    mColors: array[0..7] of PaiColor4D;
    mTextureCoords: array[0..7] of PaiVector3D;
    mNumVertices: Cardinal;
    mWeight: Single;
  end;

  PaiMesh = ^aiMesh;
  aiMesh = record
    mPrimitiveTypes, mNumVertices, mNumFaces: Cardinal;
    mVertices, mNormals, mTangents, mBitangents: ^aiList<aiVector3D>;
    mColors: array[0..7] of PaiColor4D;
    mTextureCoords: array[0..7] of PaiVector3D;
    mNumUVComponents: array[0..7] of Cardinal;
    mFaces: ^aiList<aiFace>;
    mNumBones: Cardinal;
    mBones: ^aiList<PaiBone>;
    mMaterialIndex: Cardinal;
    mName: aiString;
    mNumAnimMeshes: Cardinal;
    mAnimMeshes: ^aiList<PaiAnimMesh>;
    mMethod: aiMorphingMethod;
    mAABB: aiAABB;
    mTextureCoordsNames: ^aiList<PaiString>;
  end;

  PaiSkeletonBone = ^aiSkeletonBone;
  aiSkeletonBone = record
    mParent: Integer;
    mArmature, mNode: PaiNode;
    mNumnWeights: Cardinal;
    mMeshId: PaiMesh;
    mWeights: ^aiList<aiVertexWeight>;
    mOffsetMatrix, mLocalMatrix: aiMatrix4x4;
  end;

  PaiSkeleton = ^aiSkeleton;
  aiSkeleton = record
    mName: aiString;
    mNumBones: Cardinal;
    mBones: ^aiList<PaiSkeletonBone>;
  end;

  PaiUVTransform = ^aiUVTransform;
  aiUVTransform = record
    mTranslation, mScaling: aiVector2D;
    mRotation: aiReal;
  end;

  PaiMaterialProperty = ^aiMaterialProperty;
  aiMaterialProperty = record
    mKey: aiString;
    mSemantic, mIndex, mDataLength: Cardinal;
    mType: aiPropertyTypeInfo;
    mData: PChar;
  end;

  PaiMaterial = ^aiMaterial;
  aiMaterial = record
    mProperties: ^aiList<aiMaterialProperty>;
    mNumProperties, mNumAllocated: Cardinal;
  end;

  PaiVectorKey = ^aiVectorKey;
  aiVectorKey = record
    mTime: Double;
    mValue: aiVector3D;
    mInterpolation: aiAnimInterpolation;
  end;

  PaiQuatKey = ^aiQuatKey;
  aiQuatKey = record
    mTime: Double;
    mValue: aiQuaternion;
    mInterpolation: aiAnimInterpolation;
  end;

  PaiMeshKey = ^aiMeshKey;
  aiMeshKey = record
    mTime: Double;
    mValue: Cardinal;
  end;

  PaiMeshMorphKey = ^aiMeshMorphKey;
  aiMeshMorphKey = record
    mTime: Double;
    mValues: PCardinal;
    mWeights: PDouble;
    mNumValuesAndWeights: Cardinal;
  end;

  PaiNodeAnim = ^aiNodeAnim;
  aiNodeAnim = record
    mNodeName: aiString;
    mNumPositionKeys: Cardinal;
    mPositionKeys: ^aiList<aiVectorKey>;
    mNumRotationKeys: Cardinal;
    mRotationKeys: ^aiList<aiQuatKey>;
    mNumScalingKeys: Cardinal;
    mScalingKeys: ^aiList<aiVectorKey>;
    mPreState: aiAnimBehaviour;
    mPostState: aiAnimBehaviour;
  end;

  PaiMeshAnim = ^aiMeshAnim;
  aiMeshAnim = record
    mName: aiString;
    mNumKeys: Cardinal;
    mKeys: ^aiList<aiMeshKey>;
  end;

  PaiMeshMorphAnim = ^aiMeshMorphAnim;
  aiMeshMorphAnim = record
    mName: aiString;
    mNumKeys: Cardinal;
    mKeys: ^aiList<aiMeshMorphKey>;
  end;

  PaiAnimation = ^aiAnimation;
  aiAnimation = record
    mName: aiString;
    mDuration: Double;
    mTicksPerSecond: Double;
    mNumChannels: Cardinal;
    mChannels: ^aiList<aiNodeAnim>;
    mNumMeshChannels: Cardinal;
    mMeshChannels: ^aiList<aiMeshAnim>;
    mNumMorphMeshChannels: Cardinal;
    mMorphMeshChannels: ^aiList<aiMeshMorphAnim>;
  end;

  PaiLight = ^aiLight;
  aiLight = record
    mName: aiString;
    mType: aiLightSourceType;
    mPosition, mDirection, mUp: aiVector3D;
    mAttenuationConstant, mAttenuationLinear, mAttenuationQuadratic: Single;
    mColorDiffuse, mColorSpecular, mColorAmbient: aiColor3D;
    mAngleInnerCone, mAngleOuterCone: Single;
    mSize: aiVector2D;
  end;

  PaiCamera = ^aiCamera;
  aiCamera = record
    mName: aiString;
    mPosition, mUp, mLookAt: aiVector3D;
    mHorizontalFOV, mClipPlaneNear, mClipPlaneFar, mAspect, mOrthographicWidth: Single;
  end;

  PaiTexel = ^aiTexel;
  aiTexel = packed record
    b, g, r, a: Byte;
  end;

  PaiTexture = ^aiTexture;
  aiTexture = record
    mWidth: Cardinal;
    mHeight: Cardinal;
    achFormatHint: array[0..8] of Char;
    pcData: PaiTexel;
    mFilename: aiString;
  end;

{ PaiScene describes the contents of a 3D model }

  PaiScene = ^aiScene;
  aiScene = record
    mFlags: Cardinal;
    mRootNode: PaiNode;
    mNumMeshes: Cardinal;
    mMeshes: ^aiList<PaiMesh>;
    mNumMaterials: Cardinal;
    mMaterials: ^aiList<PaiMaterial>;
    mNumAnimations: Cardinal;
    mAnimations: ^aiList<PaiAnimation>;
    mNumTextures: Cardinal;
    mTextures: ^aiList<PaiTexture>;
    mNumLights: Cardinal;
    mLights: ^aiList<PaiLight>;
    mNumCameras: Cardinal;
    mCameras: ^aiList<PaiCamera>;
    mMetaData: PaiMetadata;
    mName: aiString;
    mNumSkeletons: Cardinal;
    mSkeletons: ^aiList<PaiSkeleton>;
    mPrivate: PChar;
  end;

  PaiFileIO = ^aiFileIO;
  aiFileIO = record end;

  aiLogStreamCallback = procedure(const param1, param2: PChar); cdecl;

  PaiLogStream = ^aiLogStream;
  aiLogStream = record
    callback: aiLogStreamCallback;
    user: PChar;
  end;

  PaiPropertyStore = ^aiPropertyStore;
  aiPropertyStore = record
    sentinel: Char;
  end;

  PaiMemoryInfo = ^aiMemoryInfo;
  aiMemoryInfo = record
    textures: Cardinal;
    materials: Cardinal;
    meshes: Cardinal;
    nodes: Cardinal;
    animations: Cardinal;
    cameras: Cardinal;
    lights: Cardinal;
    total: Cardinal;
  end;

  PaiBuffer = ^aiBuffer;
  aiBuffer = record
    data: PChar;
    _end: PChar;
  end;

  PaiImporterDesc = ^aiImporterDesc;
  aiImporterDesc = record
    mName: PChar;
    mAuthor: PChar;
    mMaintainer: PChar;
    mComments: PChar;
    mFlags: Cardinal;
    mMinMajor: Cardinal;
    mMinMinor: Cardinal;
    mMaxMajor: Cardinal;
    mMaxMinor: Cardinal;
    mFileExtensions: PChar;
  end;

function aiGetImporterDesc(extension: PChar): PaiImporterDesc; cdecl; external;

{ These import functions are used to load a model aka a scene }

function aiImportFile(pFile: PChar; pFlags: Cardinal = aiProcess_Default): PaiScene; cdecl; external;
function aiImportFileEx(pFile: PChar; pFlags: Cardinal; pFS: PaiFileIO): PaiScene; cdecl; external;
function aiImportFileExWithProperties(pFile: PChar; pFlags: Cardinal; pFS: PaiFileIO; pProps: PaiPropertyStore): PaiScene; cdecl; external;
function aiImportFileFromMemory(pBuffer: PChar; pLength: Cardinal; pFlags: Cardinal; pHint: PChar): PaiScene; cdecl; external;
function aiImportFileFromMemoryWithProperties(pBuffer: PChar; pLength: Cardinal; pFlags: Cardinal; pHint: PChar; pProps: PaiPropertyStore): PaiScene; cdecl; external;

{ Release a previously loaded model }

procedure aiReleaseImport(pScene: PaiScene); cdecl; external;

function aiApplyPostProcessing(pScene: PaiScene; pFlags: Cardinal): PaiScene; cdecl; external;
function aiGetPredefinedLogStream(pStreams: aiDefaultLogStream; fileName: PChar): aiLogStream; cdecl; external;
procedure aiAttachLogStream(var stream: aiLogStream); cdecl; external;
procedure aiEnableVerboseLogging(d: aiBool); cdecl; external;
function aiDetachLogStream(var stream: aiLogStream): aiReturn; cdecl; external;
procedure aiDetachAllLogStreams; cdecl; external;

function aiGetErrorString: PChar; cdecl; external;
function aiIsExtensionSupported(szExtension: PChar): aiBool; cdecl; external;
procedure aiGetExtensionList(out szOut: aiString); cdecl; external;
procedure aiGetMemoryRequirements(pIn: PaiScene; var info: aiMemoryInfo); cdecl; external;
function aiGetEmbeddedTexture(pIn: PaiScene; filename: PChar): PaiTexture; cdecl; external;
function aiCreatePropertyStore: PaiPropertyStore; cdecl; external;
procedure aiReleasePropertyStore(p: PaiPropertyStore); cdecl; external;

procedure aiSetImportPropertyInteger(store: PaiPropertyStore; szName: PChar; value: Integer); cdecl; external;
procedure aiSetImportPropertyFloat(store: PaiPropertyStore; szName: PChar; value: aiReal); cdecl; external;
procedure aiSetImportPropertyString(store: PaiPropertyStore; szName: PChar; var st: aiString); cdecl; external;
procedure aiSetImportPropertyMatrix(store: PaiPropertyStore; szName: PChar; var mat: aiMatrix4x4); cdecl; external;

{ Math related functions }

procedure aiCreateQuaternionFromMatrix(out quat: aiQuaternion; var mat: aiMatrix3x3); cdecl; external;
procedure aiDecomposeMatrix(var mat: aiMatrix4x4; var scaling: aiVector3D; var rotation: aiQuaternion; var position: aiVector3D); cdecl; external;
procedure aiTransposeMatrix4(var mat: aiMatrix4x4); cdecl; external;
procedure aiTransposeMatrix3(var mat: aiMatrix3x3); cdecl; external;
procedure aiTransformVecByMatrix3(var vec: aiVector3D; var mat: aiMatrix3x3); cdecl; external;
procedure aiTransformVecByMatrix4(var vec: aiVector3D; var mat: aiMatrix4x4); cdecl; external;
procedure aiMultiplyMatrix4(var dst: aiMatrix4x4; var src: aiMatrix4x4); cdecl; external;
procedure aiMultiplyMatrix3(var dst: aiMatrix3x3; var src: aiMatrix3x3); cdecl; external;
procedure aiIdentityMatrix3(var mat: aiMatrix3x3); cdecl; external;
procedure aiIdentityMatrix4(var mat: aiMatrix4x4); cdecl; external;
function aiGetImportFormatCount: UIntPtr; cdecl; external;
function aiGetImportFormatDescription(pIndex: UIntPtr): PaiImporterDesc; cdecl; external;
function aiVector2AreEqual(var a, b: aiVector2D): Integer; cdecl; external;
function aiVector2AreEqualEpsilon(var a, b: aiVector2D; epsilon: Single): Integer; cdecl; external;
procedure aiVector2Add(var dst: aiVector2D; var src: aiVector2D); cdecl; external;
procedure aiVector2Subtract(var dst: aiVector2D; var src: aiVector2D); cdecl; external;
procedure aiVector2Scale(var dst: aiVector2D; s: Single); cdecl; external;
procedure aiVector2SymMul(var dst: aiVector2D; var other: aiVector2D); cdecl; external;
procedure aiVector2DivideByScalar(var dst: aiVector2D; s: Single); cdecl; external;
procedure aiVector2DivideByVector(var dst, v: aiVector2D); cdecl; external;
function aiVector2Length(var v: aiVector2D): aiReal; cdecl; external;
function aiVector2SquareLength(var v: aiVector2D): aiReal; cdecl; external;
procedure aiVector2Negate(var dst: aiVector2D); cdecl; external;
function aiVector2DotProduct(var a, b: aiVector2D): aiReal; cdecl; external;
procedure aiVector2Normalize(var v: aiVector2D); cdecl; external;
function aiVector3AreEqual(var a, b: aiVector3D): Integer; cdecl; external;
function aiVector3AreEqualEpsilon(var a, b: aiVector3D; epsilon: Single): Integer; cdecl; external;
function aiVector3LessThan(var a, b: aiVector3D): Integer; cdecl; external;
procedure aiVector3Add(var dst: aiVector3D; var src: aiVector3D); cdecl; external;
procedure aiVector3Subtract(var dst: aiVector3D; var src: aiVector3D); cdecl; external;
procedure aiVector3Scale(var dst: aiVector3D; s: Single); cdecl; external;
procedure aiVector3SymMul(var dst: aiVector3D; var other: aiVector3D); cdecl; external;
procedure aiVector3DivideByScalar(var dst: aiVector3D; s: Single); cdecl; external;
procedure aiVector3DivideByVector(var dst, v: aiVector3D); cdecl; external;
function aiVector3Length(var v: aiVector3D): aiReal; cdecl; external;
function aiVector3SquareLength(var v: aiVector3D): aiReal; cdecl; external;
procedure aiVector3Negate(var dst: aiVector3D); cdecl; external;
function aiVector3DotProduct(var a, b: aiVector3D): aiReal; cdecl; external;
procedure aiVector3CrossProduct(var dst: aiVector3D; var a, b: aiVector3D); cdecl; external;
procedure aiVector3Normalize(var v: aiVector3D); cdecl; external;
procedure aiVector3NormalizeSafe(var v: aiVector3D); cdecl; external;
procedure aiVector3RotateByQuaternion(var v: aiVector3D; var q: aiQuaternion); cdecl; external;
procedure aiMatrix3FromMatrix4(var dst: aiMatrix3x3; var mat: aiMatrix4x4); cdecl; external;
procedure aiMatrix3FromQuaternion(var mat: aiMatrix3x3; var q: aiQuaternion); cdecl; external;
function aiMatrix3AreEqual(var a, b: aiMatrix3x3): Integer; cdecl; external;
function aiMatrix3AreEqualEpsilon(var a, b: aiMatrix3x3; epsilon: Single): Integer; cdecl; external;
procedure aiMatrix3Inverse(var mat: aiMatrix3x3); cdecl; external;
function aiMatrix3Determinant(var mat: aiMatrix3x3): aiReal; cdecl; external;
procedure aiMatrix3RotationZ(var mat: aiMatrix3x3; angle: Single); cdecl; external;
procedure aiMatrix3FromRotationAroundAxis(var mat: aiMatrix3x3; var axis: aiVector3D; angle: Single); cdecl; external;
procedure aiMatrix3Translation(var mat: aiMatrix3x3; var translation: aiVector2D); cdecl; external;
procedure aiMatrix3FromTo(var mat: aiMatrix3x3; var from, toVec: aiVector3D); cdecl; external;
procedure aiMatrix4FromMatrix3(var dst: aiMatrix4x4; var mat: aiMatrix3x3); cdecl; external;
procedure aiMatrix4FromScalingQuaternionPosition(var mat: aiMatrix4x4; var scaling: aiVector3D; var rotation: aiQuaternion; var position: aiVector3D); cdecl; external;
procedure aiMatrix4Add(var dst: aiMatrix4x4; var src: aiMatrix4x4); cdecl; external;
function aiMatrix4AreEqual(var a, b: aiMatrix4x4): Integer; cdecl; external;
function aiMatrix4AreEqualEpsilon(var a, b: aiMatrix4x4; epsilon: Single): Integer; cdecl; external;
procedure aiMatrix4Inverse(var mat: aiMatrix4x4); cdecl; external;
function aiMatrix4Determinant(var mat: aiMatrix4x4): aiReal; cdecl; external;
function aiMatrix4IsIdentity(var mat: aiMatrix4x4): Integer; cdecl; external;
procedure aiMatrix4DecomposeIntoScalingEulerAnglesPosition(var mat: aiMatrix4x4; out scaling, rotation, position: aiVector3D); cdecl; external;
procedure aiMatrix4DecomposeIntoScalingAxisAnglePosition(var mat: aiMatrix4x4; out scaling, axis: aiVector3D; out angle: aiReal; out position: aiVector3D); cdecl; external;
procedure aiMatrix4DecomposeNoScaling(var mat: aiMatrix4x4; var rotation: aiQuaternion; var position: aiVector3D); cdecl; external;
procedure aiMatrix4FromEulerAngles(var mat: aiMatrix4x4; x, y, z: Single); cdecl; external;
procedure aiMatrix4RotationX(var mat: aiMatrix4x4; angle: Single); cdecl; external;
procedure aiMatrix4RotationY(var mat: aiMatrix4x4; angle: Single); cdecl; external;
procedure aiMatrix4RotationZ(var mat: aiMatrix4x4; angle: Single); cdecl; external;
procedure aiMatrix4FromRotationAroundAxis(var mat: aiMatrix4x4; var axis: aiVector3D; angle: Single); cdecl; external;
procedure aiMatrix4Translation(var mat: aiMatrix4x4; var translation: aiVector3D); cdecl; external;
procedure aiMatrix4Scaling(var mat: aiMatrix4x4; var scaling: aiVector3D); cdecl; external;
procedure aiMatrix4FromTo(var mat: aiMatrix4x4; var from, toVec: aiVector3D); cdecl; external;
procedure aiQuaternionFromEulerAngles(var q: aiQuaternion; x, y, z: Single); cdecl; external;
procedure aiQuaternionFromAxisAngle(var q: aiQuaternion; var axis: aiVector3D; angle: Single); cdecl; external;
procedure aiQuaternionFromNormalizedQuaternion(var q: aiQuaternion; var normalized: aiVector3D); cdecl; external;
function aiQuaternionAreEqual(var a, b: aiQuaternion): Integer; cdecl; external;
function aiQuaternionAreEqualEpsilon(var a, b: aiQuaternion; epsilon: Single): Integer; cdecl; external;
procedure aiQuaternionNormalize(var q: aiQuaternion); cdecl; external;
procedure aiQuaternionConjugate(var q: aiQuaternion); cdecl; external;
procedure aiQuaternionMultiply(var dst: aiQuaternion; var q: aiQuaternion); cdecl; external;
procedure aiQuaternionInterpolate(var dst: aiQuaternion; var start, _end: aiQuaternion; factor: Single); cdecl; external;

type
  aiTextureOp = (
    aiTextureOp_Multiply = $0,
    aiTextureOp_Add = $1,
    aiTextureOp_Subtract = $2,
    aiTextureOp_Divide = $3,
    aiTextureOp_SmoothAdd = $4,
    aiTextureOp_SignedAdd = $5
  );

  aiTextureMapMode = (
    aiTextureMapMode_Wrap = $0,
    aiTextureMapMode_Clamp = $1,
    aiTextureMapMode_Mirror = $2,
    aiTextureMapMode_Decal = $3
  );

  aiTextureMapping = (
    aiTextureMapping_UV = $0,
    aiTextureMapping_SPHERE = $1,
    aiTextureMapping_CYLINDER = $2,
    aiTextureMapping_BOX = $3,
    aiTextureMapping_PLANE = $4,
    aiTextureMapping_OTHER = $5
  );

  aiTextureType = (
    aiTextureType_NONE = 0,
    aiTextureType_DIFFUSE = 1,
    aiTextureType_SPECULAR = 2,
    aiTextureType_AMBIENT = 3,
    aiTextureType_EMISSIVE = 4,
    aiTextureType_HEIGHT = 5,
    aiTextureType_NORMALS = 6,
    aiTextureType_SHININESS = 7,
    aiTextureType_OPACITY = 8,
    aiTextureType_DISPLACEMENT = 9,
    aiTextureType_LIGHTMAP = 10,
    aiTextureType_REFLECTION = 11,
    aiTextureType_BASE_COLOR = 12,
    aiTextureType_NORMAL_CAMERA = 13,
    aiTextureType_EMISSION_COLOR = 14,
    aiTextureType_METALNESS = 15,
    aiTextureType_DIFFUSE_ROUGHNESS = 16,
    aiTextureType_AMBIENT_OCCLUSION = 17,
    aiTextureType_UNKNOWN = 18,
    aiTextureType_SHEEN = 19,
    aiTextureType_CLEARCOAT = 20,
    aiTextureType_TRANSMISSION = 21,
    aiTextureType_MAYA_BASE = 22,
    aiTextureType_MAYA_SPECULAR = 23,
    aiTextureType_MAYA_SPECULAR_COLOR = 24,
    aiTextureType_MAYA_SPECULAR_ROUGHNESS = 25,
    aiTextureType_ANISOTROPY = 26,
    aiTextureType_GLTF_METALLIC_ROUGHNESS = 27
  );

function aiTextureTypeToString(inType: aiTextureType): PChar; cdecl; external;

function aiGetMaterialProperty(
  pMat: PaiMaterial;
  pKey: PChar;
  pType, pIndex: Cardinal;
  var pPropOut: PaiMaterialProperty
): aiReturn; cdecl; external;

function aiGetMaterialFloatArray(
  pMat: PaiMaterial;
  pKey: PChar;
  pType, pIndex: Cardinal;
  pOut: PSingle;
  pMax: PCardinal
): aiReturn; cdecl; external;

function aiGetMaterialIntegerArray(
  pMat: PaiMaterial;
  pKey: PChar;
  pType, pIndex: Cardinal;
  pOut: PInteger;
  pMax: PCardinal
): aiReturn; cdecl; external;

function aiGetMaterialColor(
  pMat: PaiMaterial;
  pKey: PChar;
  pType, pIndex: Cardinal;
  pOut: PaiColor4D
): aiReturn; cdecl; external;

function aiGetMaterialUVTransform(
  pMat: PaiMaterial;
  pKey: PChar;
  pType, pIndex: Cardinal;
  pOut: PaiUVTransform
): aiReturn; cdecl; external;

function aiGetMaterialString(
  pMat: PaiMaterial;
  pKey: PChar;
  pType, pIndex: Cardinal;
  pOut: PaiString
): aiReturn; cdecl; external;

function aiGetMaterialTextureCount(
  pMat: PaiMaterial;
  pType: aiTextureType
): Cardinal; cdecl; external;

function aiGetMaterialTexture(
  pMat: PaiMaterial;
  pType: aiTextureType;
  pIndex: Cardinal;
  out pPath: aiString;
  out pMapping: aiTextureMapping;
  out pUVIndex: Cardinal;
  out pBlend: Single;
  out pOp: aiTextureOp;
  out pMapMode: aiTextureMapMode;
  out pFlags: Cardinal
): aiReturn; cdecl; external;

implementation

{$ifdef linux}
	{.$define static}
  {$ifdef static}
    {$linklib libassimp.a}
    {$l z}
    {$l stdc++}
    {$l m}
    {$l gcc_s}
  {$else}
		{$l libassimp.so}
	{$endif}
{$endif}
{$ifdef windows}
		{$l libassimp.dll}
{$endif}

{ aiString }

function aiString.ToString: string;
begin
  if Self.length > 0 then
    Result := PChar(@Self.data)
  else
    Result := '';
end;

end.




