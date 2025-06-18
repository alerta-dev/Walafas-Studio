const parts = ['body','arms','head','eyes','mouth','hair','feet','extras'];
const counts = { body:5, arms:5, head:5, eyes:5, mouth:5, hair:5, feet:5, extras:5 };
const indices = Object.fromEntries(parts.map(p=>[p,0]));
const positions = { body:[0,0], arms:[0,0], head:[0,0], eyes:[0,0], mouth:[0,0], hair:[0,0], feet:[0,0], extras:[0,0] };

const canvas = document.getElementById('avatarCanvas');
const ctx = canvas.getContext('2d');

function loadPart(part, idx){
  const img = new Image();
  img.src = `assets/${part}/${idx+1}.png`;
  return img;
}

function draw(){
  ctx.clearRect(0,0,canvas.width,canvas.height);
  // Ajusta orden si quieres cambiar la superposición
  ['feet','body','arms','head','eyes','mouth','hair','extras'].forEach(part=>{
    const img = loadPart(part, indices[part]);
    img.onload = ()=> {
      const [x,y] = positions[part];
      ctx.drawImage(img, x, y, canvas.width, canvas.height);
    };
  });
  // También actualizar miniaturas
  document.querySelectorAll('.control').forEach(ctrl=>{
    const part = ctrl.dataset.part;
    const thumb = ctrl.querySelector('img');
    thumb.src = `assets/${part}/${indices[part]+1}.png`;
  });
}

// Eventos flechas
document.querySelectorAll('.control').forEach(ctrl=>{
  const part = ctrl.dataset.part;
  ctrl.querySelector('.prev').onclick = () => {
    indices[part] = (indices[part] - 1 + counts[part]) % counts[part];
    draw();
  };
  ctrl.querySelector('.next').onclick = () => {
    indices[part] = (indices[part] + 1) % counts[part];
    draw();
  };
});

// Exportar
document.getElementById('exportBtn').onclick = ()=>{
  const link = document.createElement('a');
  link.href = canvas.toDataURL('image/png',1.0);
  link.download = 'avatar.png';
  link.click();
};

// Modo claro/oscuro
document.getElementById('modeBtn').onclick = ()=>{
  document.body.classList.toggle('dark');
};

window.onload = draw;
