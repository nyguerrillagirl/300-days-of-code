import GrandchildComponent from "./GrandchildComponent";
function ChildComponent({ dataFromParent }) {
    return (
        <div>
          <p>Your email: {dataFromParent.email}</p>
          <GrandchildComponent dataFromChild={dataFromParent} />
        </div>
      );
}

export default ChildComponent;