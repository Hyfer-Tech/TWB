let EditPhoto = React.createClass({
  
  getInitialState() {
    return {
      editable: false
    }
  },

  handleEdit() {
    this.setState({editable: !this.state.editable});
  },

  showPhoto() {
    if(this.state.editable) {
      return (
        <div className="text-center">
          <label className="custom-file-upload" data-toggle="modal" data-target="#myModal">
            <i className="fa fa-cloud-upload"></i> Upload Photo
          </label>
           
          <div className="modal fade" id="myModal" role="dialog">
            <div className="modal-dialog">
              <div className="modal-content">
                <div className="modal-header">
                  <button type="button" className="close" data-dismiss="modal">&times;</button>
                  <h4 className="modal-title">Upload Picture</h4>
                </div>
                <div className="modal-body">
                
                </div>
                <div className="modal-footer">
                  <button type="button" className="btn btn-default" data-dismiss="modal">Submit</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      )
    } else {
      return (
        <img src={this.props.user.avatar.url} 
             className="prof-pic" onClick={this.handleEdit}/>
      )
    }
  },

  render() {
    return (
      <div>
        { this.showPhoto() }
      </div>
    )
  }
});