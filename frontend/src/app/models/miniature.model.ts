export interface Miniatura {
  id?: number;
  nombre: string;
  grupo: string;
  faccion: string;
  edicion: string;
  peana: string;
  imagen: string;
}

export interface MiniaturasResponse {
  status: string;
  total: number;
  data: Miniatura[];
}