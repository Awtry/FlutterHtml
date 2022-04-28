/*class Places{
  String id;
  String nombre;
  String descripcion;
  String direccion;
  String telefono;
  String website;
  String imageName;
}*/

class Places {
  String? id;
  String? nombre;
  String? descripcion;
  String? direccion;
  String? telefono;
  String? website;
  String? imagenNombre;
  String? importancia;
  String? latitud;
  String? longitud;
  String? rating;
  String? title;
  String? reaction;

  Places(
      {this.id,
      this.nombre,
      this.descripcion,
      this.direccion,
      this.telefono,
      this.website,
      this.imagenNombre,
      this.importancia,
      this.latitud,
      this.longitud,
      this.rating,
      this.title,
      this.reaction});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    direccion = json['direccion'];
    telefono = json['telefono'];
    website = json['website'];
    imagenNombre = json['imagen_nombre'];
    importancia = json['importancia'];
    latitud = json['latitud'];
    longitud = json['longitud'];
    rating = json['rating'];
    title = json['title'];
    reaction = json['reaction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['descripcion'] = this.descripcion;
    data['direccion'] = this.direccion;
    data['telefono'] = this.telefono;
    data['website'] = this.website;
    data['imagen_nombre'] = this.imagenNombre;
    data['importancia'] = this.importancia;
    data['latitud'] = this.latitud;
    data['longitud'] = this.longitud;
    data['rating'] = this.rating;
    data['title'] = this.title;
    data['reaction'] = this.reaction;
    return data;
  }
}
