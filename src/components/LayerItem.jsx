import React, { useRef, useEffect } from 'react'
import { Image, Transformer } from 'react-konva'
import useImage from 'use-image'

function SpriteLayer({ id, src, x=0, y=0, width, height, rotation=0, isSelected=false, onSelect, onChange }) {
  const [image] = useImage(src)
  const shapeRef = useRef()
  const trRef = useRef()

  useEffect(() => {
    if (isSelected) {
      trRef.current.nodes([shapeRef.current])
      trRef.current.getLayer().batchDraw()
    }
  }, [isSelected])

  return (
    <>
      <Image
        image={image}
        x={x}
        y={y}
        width={width}
        height={height}
        rotation={rotation}
        ref={shapeRef}
        draggable
        onClick={onSelect}
        onTap={onSelect}
        onDragEnd={e => onChange({ x: e.target.x(), y: e.target.y() })}
        onTransformEnd={e => {
          const node = shapeRef.current
          const scaleX = node.scaleX()
          const scaleY = node.scaleY()
          node.scaleX(1)
          node.scaleY(1)
          onChange({
            x: node.x(),
            y: node.y(),
            rotation: node.rotation(),
            width: Math.max(5, node.width() * scaleX),
            height: Math.max(5, node.height() * scaleY)
          })
        }}
      />
      {isSelected && <Transformer ref={trRef} />}
    </>
  )
}

export default function LayerItem(props) {
  return <SpriteLayer {...props} />
}
