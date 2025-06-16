import React, { useState } from 'react'
import { v4 as uuidv4 } from 'uuid'

const categories = ['cuerpos', 'brazos', 'ojos', 'bocas', 'cabezas', 'cabellos/lineas', 'cabellos/colores', 'extras']

export default function AddLayerModal({ onAdd, onClose }) {
  const [category, setCategory] = useState(categories[0])
  const [fileList, setFileList] = useState([])

  // Cargar archivos de public/assets
  useEffect(() => {
    fetch(`/assets/${category}/`).then(res => res.json()).then(list => setFileList(list))
  }, [category])

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
      <div className="bg-white p-6 rounded shadow-lg w-80">
        <h3 className="text-xl mb-4">Agregar capa</h3>
        <select value={category} onChange={e => setCategory(e.target.value)} className="w-full mb-4">
          {categories.map(c => <option key={c} value={c}>{c}</option>)}
        </select>
        <div className="h-40 overflow-auto mb-4">
          {fileList.map(name => (
            <div key={name} className="cursor-pointer hover:bg-gray-100 p-1" onClick={() => onAdd({
              id: uuidv4(),
              name,
              src: `/assets/${category}/${name}`,
              x: 100, y: 100,
              width: 100, height: 100,
              rotation: 0,
              isSelected: false
            })}>
              {name}
            </div>
          ))}
        </div>
        <button onClick={onClose} className="mt-2 w-full py-2 bg-red-500 text-white rounded">Cancelar</button>
      </div>
    </div>
  )
}
